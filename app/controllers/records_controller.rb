class RecordsController < ApplicationController
  require "date"
  protect_from_forgery only: [:carry_out]
  before_action :set_timezone, only: [:index, :new, :by_item_new]

  def index
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
    move_to_index
  end

  def update
    @record = Record.find(params[:id])
    move_to_index
    if @record.update(record_params)
      redirect_to records_path
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    move_to_index
    @record.destroy
    redirect_to records_path
  end

  #リマインドの一括出力を定義
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
        exc_amount_id: record[:exc_amount_id],
        exc_shape_id: record[:exc_shape_id]
      )
    end
    redirect_to :root
  end

  #お客様ごとの一括実施を定義
  def bulk_carry
    @client = Client.find(params[:client_id])
    @records = @client.records.where(start_time: Date.today.beginning_of_day...Time.now)
    @records.each do |record|
      record.update(
        carryout_id: 2
      )
    end
  end

  #アイコンのダブルクリックによる実施切り替えを定義
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
    params.require(:record).permit(:client_id, :major_item_id, :main_item_id, :sub_item_id, :start_time, :end_time, :memo, :remind, :carryout_id, :exc_shape_id, :exc_amount_id, :urine_amount).merge(user_id: current_user.id)
  end

  def move_to_index
    if (current_user.id != @record.user_id) && (current_user.position_id < 4)
      redirect_to root_path
    end
  end

  def set_timezone
    @default = Date.today.beginning_of_day.in_time_zone
    @defaultend = Date.today.end_of_day.in_time_zone
    @morning = @default+6.hour...@default+10.hour
    @lunch = @default+11.hour...@default+14.hour
    @evening = @default+17.hour...@default+21.hour
  end

end
