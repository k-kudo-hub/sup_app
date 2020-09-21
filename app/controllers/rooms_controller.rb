class RoomsController < ApplicationController

  def index
    @clients = Client.includes(:detail, :caregiver, :room).order("room_number ASC")
    @rooms = Room.includes(:client)
  end
  
end
