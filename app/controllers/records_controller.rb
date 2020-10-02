class RecordsController < ApplicationController
  require "date"

  def index
    @default = Date.today.beginning_of_day.in_time_zone
    @clients = Client.includes(:records).order("room_number ASC")
  end

  def new
    @record = Record.new
    @clients = Client.includes(:detail, :caregiver, :room).order("room_number ASC")
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to 
    else
      redirect_to :new
    end
  end

  # def bulk_create
  #   range = Date.today.beginning_of_day..Timw.now
  #   @records = Score.find(created_at: range)
  # end

  private

  def record_params
    params.require(:record).permit(:client_id, :major_item_id, :main_item_id, :sub_item_id, :start_time, :end_time, :memo).merge(user_id: current_user.id)
  end

end
