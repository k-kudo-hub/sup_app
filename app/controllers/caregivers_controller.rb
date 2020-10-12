class CaregiversController < ApplicationController
  before_action :set_caregiver, only: [:edit, :update]
  before_action :move_to_index, only: [:new, :edit, :update]
  
  def new
  end

  def edit
  end

  def update
    if @caregiver.update(caregiver_params)
      redirect_to client_path(@caregiver.client)
    else
      render :edit
    end
  end

  private

  def caregiver_params
    params.require(:caregiver).permit(:degree_id, :cognition_id, :move_id, :move_exp, :meal_id, :meal_exp, :excretion_id, :excretion_exp, :oral_id, :oral_exp, :bathing_id, :bathing_exp)
  end

  def set_caregiver
    @caregiver = Caregiver.find(params[:id])
  end

  def move_to_index
    if current_user.position_id < 4
      redirect_to root_path
    end
  end

end
