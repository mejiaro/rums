class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations.where(room_id: params[:room_id])
  end
end
