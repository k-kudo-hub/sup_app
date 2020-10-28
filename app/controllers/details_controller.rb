class DetailsController < ApplicationController
  before_action :set_detail, only: [:edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def edit
    @detail = Detail.find(params[:id])
  end

  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params)
      redirect_to client_path(@detail.client.id)
    else
      render :edit
    end
  end

  private

  def detail_params
    params.require(:detail).permit(:past_history, :illness, :doctor, :medicine, :mbp_high, :mbp_low)
  end

  def set_detail
    @detail = Detail.find(params[:id])
  end

  def move_to_index
    if current_user.position_id < 4
      redirect_to root_path
    end
  end


end
