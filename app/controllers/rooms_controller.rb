class RoomsController < ApplicationController

  #トップページ表示のための定義
  def index
    @clients = Client.includes(:detail, :caregiver, :room).order("room_number ASC")
    @lists = Room.pluck(:client_id)
    @message = Message.last
  end

  #ルームの作成とチャット画面の表示
  def create
    @users = User.all.ids
    @client = Client.find(params[:format])
    @room = Room.new(client_id: @client.id)
    if @room.save
        @users.each do |user|
        RoomUser.create(room_id:@room.id, user_id:user)
      end
      @message = Message.new
      @messages = @room.messages.all.order("id ASC")
      render "messages/index"
    else
      redirect_to root_path
    end
  end

  #ルームへのメンバー追加とチャット画面への遷移
  def add_user
    @users = User.all.ids
    @room = Room.find(params[:id])
    @roomusers = RoomUser.select(:room_id == @room.id)
    @whereme = @roomusers.pluck(:user_id)
    unless @whereme.include?(current_user.id)
      RoomUser.create(room_id: @room.id, user_id: current_user.id)
      @message = Message.new
      @messages = @room.messages.all.order("id ASC")
      render "messages/index"
    else
      @message = Message.new
      @messages = @room.messages.all.order("id ASC")
      render "messages/index"
    end
  end

end
