class CaregiversController < ApplicationController
  
  def new
  end

  def edit
    @caregiver = Caregiver.find(params[:id])
  end

  def update
    @caregiver = Caregiver.find(params[:id])
    if @caregiver.update(caregiver_params)
      redirect_to client_path(@caregiver.client)
    else
      render :edit
    end
  end

  def caregiver_params
    params.require(:caregiver).permit(:degree_id, :cognition_id, :move_id, :move_exp, :meal_id, :meal_exp, :excretion_id, :excretion_exp, :oral_id, :oral_exp, :bathing_id, :bathing_exp)
  end

end
