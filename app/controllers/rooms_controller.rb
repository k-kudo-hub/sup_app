class RoomsController < ApplicationController
  before_action :set_search, only: [:index, :search_clients]
  before_action :set_client, only: [:index, :search_clients]

  #トップページ表示のための定義
  def index
    @clients = Client.includes(:detail, :caregiver, :room).order("room_number ASC")
    # @caution = Message.select()
  end

  def search_clients
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
      move_to_message
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
      move_to_message
    else
      move_to_message
    end
  end

  private

  def client_search_params
    params.fetch(:search, {}).permit(:name, :name_kana, :room_number)
  end

  def set_search
    @search_params = client_search_params
    @clients = Client.search(@search_params)
  end

  def set_client
    @lists = Room.pluck(:client_id)
    @message = Message.last
  end

  def move_to_message
    @message = Message.new
    @messages = @room.messages.all.order("id ASC")
    render "messages/index"
  end

end
