class UsersController < ApplicationController  

  def show
    @user = User.find(current_user.id)
    clientsid = @user.relationships.pluck(:client_id)
    @clients = Client.find(clientsid)
    @lists = Room.pluck(:client_id)
  end
  
end
