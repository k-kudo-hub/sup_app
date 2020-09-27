class MessagesController < ApplicationController

  def create
    @message = Message.create(room_params)
    render json: {message: @message}
  end

  private

  def room_params
    params.require(:message).permit(:content, :tag_id, :user_id, :room_id, :user_name, :picture).merge(user_id:params[:message][:user_id], room_id:params[:message][:room_id])
  end
  
end
