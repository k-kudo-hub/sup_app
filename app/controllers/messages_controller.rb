class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @user = User.all
    @client = Client.find(@room.client.id)
    # @client = Client.find(@room.client.id)
  end

end
