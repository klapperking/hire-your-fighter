class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home; end

  def my_fighters
    @fighters = Fighter.where('user_id = ?', current_user.id.to_s)
    @bookings = Booking.all
  end

  def my_bookings
    @bookings = Booking.where('user_id = ?', current_user.id.to_s)
  end

  def dashboard
    @fighters = Fighter.where('user_id = ?', current_user.id.to_s)
    @bookings = Booking.where('user_id = ?', current_user.id.to_s)
    @users = User.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end
end
