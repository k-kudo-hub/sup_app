class NutritionsController < ApplicationController
before_action :set_timezone, only: [:new, :create]

  def new
    @nutritions = Nutrition.where(date: Date.today)
    @clients = Client.includes(:nutritions).order(room_number: :desc)
  end

  def create
    @nutrition = Nutrition.new(nutrition_params)
    @nutrition.save
  end


private

  def nutrition_params
    params.permit(:six_water_amount, :morning_water_amount, :morning_meal_m_id, :morning_meal_s_id, :ten_water_amount, :lunch_water_amount, :lunch_meal_m_id, :lunch_meal_s_id, :fifty_water_amount, :dinner_water_amount, :dinner_meal_m_id, :dinner_meal_s_id, :twenty_water_amount).merge(user_id: current_user.id, client_id: params[:client_id], date: Date.today)
  end

  def set_timezone
    @default = Date.today.beginning_of_day.in_time_zone
    @defaultend = Date.today.end_of_day.in_time_zone
    @morning = @default+6.hour...@default+10.hour
    @lunch = @default+11.hour...@default+14.hour
    @evening = @default+17.hour...@default+21.hour
  end

end
