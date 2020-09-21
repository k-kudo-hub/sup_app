class DetailsController < ApplicationController
  before_action :set_detail, only: [:edit, :update]

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
    params.require(:detail).permit(:past_history, :illness, :medicine, :mbp_high, :mbp_low)
  end

  def set_detail
    @detail = Detail.find(params[:id])
  end

end
