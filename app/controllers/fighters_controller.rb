class FightersController < ApplicationController
  before_action :set_fighter, only: %i[show]
  def index
    @fighters = Fighter.all
  end

  def show
  end

  private

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end
end
