class RelationshipsController < ApplicationController
 before_action :set_client, only: [:create, :destroy]
 
  def create
    following = Relationship.new(client_id: @client.id, user_id: current_user.id)
    if following.save
      flash[:success] = 'お客様をフォローしました'
      redirect_to @client
    else
      flash.now[:alert] = 'お客様のフォローに失敗しました'
      redirect_to @client
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.destroy
      flash[:success] = 'お客様のフォローを解除しました'
      redirect_to @client
    else
      flash.now[:alert] = 'お客様のフォロー解除に失敗しました'
      redirect_to @client
    end
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

end
