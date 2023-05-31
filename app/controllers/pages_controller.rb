class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home; end

  def my_fighters
    @fighters = Fighter.where('user_id = ?', current_user.id.to_s)
  end

  def my_bookings
    @bookings = Booking.where('user_id = ?', current_user.id.to_s)
  end
end
