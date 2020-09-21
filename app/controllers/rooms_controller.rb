class RoomsController < ApplicationController

  def index
    @clients = Client.includes(:detail, :caregiver).order("room_number DESC")
  end
  
end
