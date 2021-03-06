class ClientsController < ApplicationController
  before_action :move_to_index, only: %i[new create create_detail create_caregiver edhit update destroy]
  before_action :set_client, only: %i[show edit update destroy]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    render :new and return unless @client.valid?
    session[:client_data] = { client: @client.attributes }
    @detail = @client.build_detail
    render :new_detail
  end
  def create_detail
    @detail = Detail.new(detail_params)
    render :new_detail and return unless @detail.valid?

    session[:detail_data] = { detail: @detail.attributes }
    @client = Client.new(session[:client_data]['client'])
    @caregiver = @client.build_caregiver
    render :new_caregiver
  end
  def create_caregiver
    @client = Client.new(session[:client_data]['client'])
    @detail = Detail.new(session[:detail_data]['detail'])
    @caregiver = Caregiver.new(caregiver_params)
    render :new_caregiver and return unless @caregiver.valid?
    @client.save
    session[:client_data].clear
    @detail.client_id = @client.id
    @detail.save
    session[:detail_data].clear
    @caregiver.client_id = @client.id
    @caregiver.save
    render :create_caregiver
  end

  def show
    @detail = @client.detail
    @caregiver = @client.caregiver
    @relation = current_user.relationships.pluck(:client_id)
    @follow = current_user.relationships.select(client_id: @client.id).ids
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to client_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.position_id > 1
      @client.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :name_kana, :room_number, :status_id, :picture, :birth, :sex_id, :insurance, :careplan, detail_attributes: [:id], caregiver_attributes: [:id])
  end

  def detail_params
    params.require(:detail).permit(:past_history, :illness, :doctor, :medicine, :mbp_high, :mbp_low)
  end

  def caregiver_params
    params.require(:caregiver).permit(:degree_id, :cognition_id, :move_id, :move_exp, :meal_id, :meal_exp, :excretion_id, :excretion_exp, :oral_id, :oral_exp, :bathing_id, :bathing_exp)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.position_id < 4
  end
end
