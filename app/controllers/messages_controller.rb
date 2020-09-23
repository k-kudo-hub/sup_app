class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    @client = Client.find(@room.client.id)
    @users = User.all
  end
  
end
