class ReservationsController < ApplicationController
  
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new(params.require(:reservation).permit(:start, :end, :number_of_people, :hotel_id))
    @hotel = @reservation.hotel
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start, :end, :number_of_people,:price , :hotel_id, :user_id))
    if @reservation.save
      flash[:notice] = "ホテルを予約しました"
      redirect_to @reservation
    else
      render "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

end
