class RecordsController < ApplicationController
  require "date"
  protect_from_forgery only: [:carry_out]

  def index
    @default = Date.today.beginning_of_day.in_time_zone
    @defaultend = Date.today.end_of_day.in_time_zone
    @clients = Client.includes(:records).order("room_number ASC")
  end

  def new
    params[:client_id]
    @record = Record.new
    @clients = Client.includes(:detail, :caregiver, :room).order("room_number ASC")
  end

  def create
    @record = Record.new(record_params)
    if @record.valid? 
      @record.save
      redirect_to 
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  def bulk_create
    @records = Record.where(remind: true)
    @records.each do |record|
      @record = Record.create(
        client_id: record[:client_id],
        major_item_id: record[:major_item_id],
        main_item_id: record[:main_item_id],
        sub_item_id: record[:sub_item_id],
        start_time: Time.new(Date.today.year,Date.today.mon,Date.today.day,record[:start_time].hour,record[:start_time].min,record[:start_time].sec).to_time.to_s,
        end_time: Time.new(Date.today.year,Date.today.mon,Date.today.day,record[:start_time].hour,record[:start_time].min,record[:start_time].sec).to_time.to_s,
        memo: record[:memo],
        user_id: current_user.id,
        carryout_id: 1,
        remind: false,
        meal_m_id: record[:meal_m_id],
        meal_s_id: record[:meal_s_id],
        water_amount: record[:water_amount],
        exc_amount_id: record[:exc_amount_id],
        exc_shape_id: record[:exc_shape_id]
      )
    end
    redirect_to :root
  end

  def bulk_carry
    @client = Client.find(params[:client_id])
    @records = @client.records.where(start_time: Date.today.beginning_of_day...Time.now)
    @records.each do |record|
      record.update(
        carryout_id: 2
      )
    end
    redirect_to :root
  end

  def carry_out
    record = Record.find(params[:id])
    if record.carryout_id == 1
      record.update(carryout_id: 2)
    else
      record.update(carryout_id: 1)
    end
    carry = Record.find(params[:id])
    render json: { record: carry }
  end

  private

  def record_params
    params.require(:record).permit(:client_id, :major_item_id, :main_item_id, :sub_item_id, :start_time, :end_time, :memo, :remind, :carryout_id, :meal_m_id, :meal_s_id, :water_amount, :exc_shape_id, :exc_amount_id, :urine_amount).merge(user_id: current_user.id)
  end

end
