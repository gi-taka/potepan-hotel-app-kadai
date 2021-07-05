class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: session[:user_id])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :person_num, :total_amount))
    if @reservation.save
      redirect_to "/reservations/#{@reservation.id}"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
