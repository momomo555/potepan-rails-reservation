class HotelsController < ApplicationController
  def index
  end

  def search
    @hotels = Hotel.where("address LIKE ? AND comment LIKE ?", "%#{params[:area]}%", "%#{params[:keyword]}%")
  end

  def posts
    @hotels = current_user.hotels
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(params.require(:hotel).permit(:name, :comment, :price, :address, :image, :owner_id))
    if @hotel.save
      flash[:notice] = "ホテルを登録しました"
      redirect_to @hotel
    else
      render "new"
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
