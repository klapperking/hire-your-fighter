class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @fighter = Fighter.find(params[:fighter_id])
    @booking = Booking.new(booking_params)
    @booking.fighter = @fighter
    @booking.user = current_user
    @booking.price = (@booking.expiration_date - @booking.starting_date) * @fighter.price

    if @booking.save
      redirect_to my_bookings_path
    else
      render "fighters/show", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    if @booking.save
      redirect_to my_bookings_path
    else
      render "pages/my_fighters", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :expiration_date, :fighter_id, :user_id)
  end
end
