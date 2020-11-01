class RoomsController < ApplicationController
  before_action :set_search, only: %i[index search_clients]
  before_action :set_client, only: %i[index search_clients]

  # トップページ表示のための定義
  def index
    @clients = Client.includes(:detail, :caregiver, :room, :records).order('room_number ASC')
    @default = Time.current.ago(7.days)...Time.current
    @today = Date.today.beginning_of_day...Date.today.end_of_day
    @reports = Report.where(occ_time: @default).page(params[:page]).per(5).order('occ_time DESC')
    @threedays = Time.current.ago(3.days)...Time.current
    set_serach_column
  end

  def search_clients
    @clients = @p.result.includes(:records, :room)
    @default = Time.current.ago(7.days)...Time.current
    @today = Date.today.beginning_of_day...Date.today.end_of_day
  end

  # ルームの作成とチャット画面の表示
  def create
    @users = User.pluck(:id)
    @client = Client.find(params[:format])
    @room = Room.new(client_id: @client.id)
    if @room.save
      @users.each do |user|
        RoomUser.create(room_id: @room.id, user_id: user)
      end
      move_to_message
    else
      redirect_to root_path
    end
  end

  # ルームへのメンバー追加とチャット画面への遷移
  def add_user
    @users = User.pluck(:id)
    @room = Room.find(params[:id])
    @roomusers = RoomUser.select(:room_id == @room.id)
    @whereme = @roomusers.pluck(:user_id)
    if @whereme.include?(current_user.id)
      move_to_message
    else
      RoomUser.create(room_id: @room.id, user_id: current_user.id)
      move_to_message
    end
  end

  private

  def client_search_params
    params.fetch(:search, {}).permit(:name, :name_kana, :room_number)
  end

  def set_search
    @p = Client.ransack(params[:q])
  end

  def set_serach_column
    @client_name = Client.select('name').distinct
    @client_name_kana = Client.select('name_kana').distinct
    @client_room_number = Client.select('room_number').distinct
  end

  def set_client
    @lists = Room.pluck(:client_id)
    @message = Message.last
  end

  def move_to_message
    @message = Message.new
    @messages = @room.messages.all.order('id ASC')
    render 'messages/index'
  end
end
