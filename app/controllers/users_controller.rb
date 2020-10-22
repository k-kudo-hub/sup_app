class UsersController < ApplicationController  

  def show
    @user = User.find(params[:id])
    clientsid = @user.relationships.pluck(:client_id)
    @clients = Client.find(clientsid)
    @lists = Room.pluck(:client_id)
  end
  
end
