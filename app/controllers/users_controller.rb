class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    clientsid = @user.relationships.pluck(:client_id)
    @clients = Client.find(clientsid)
    @lists = Room.pluck(:client_id)
    @default = Time.current.ago(7.days)...Time.current
    @today = Date.today.beginning_of_day...Date.today.end_of_day
  end
end
