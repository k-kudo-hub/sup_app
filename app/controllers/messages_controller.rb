class MessagesController < ApplicationController

  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages.all.order("id ASC")
  end

  def create
    @message = Message.new(room_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private

  def room_params
    params.require(:message).permit(:content, :tag_id, :user_id, :room_id, :user_name, :picture).merge(user_id:params[:message][:user_id], room_id:params[:message][:room_id])
  end

end
