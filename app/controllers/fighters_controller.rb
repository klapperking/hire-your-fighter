class FightersController < ApplicationController
  before_action :set_fighter, only: %i[show edit destroy]

  def index
    @fighters = Fighter.all
  end

  def show
  end

  # GET '/fighters/new'
  def new
    # create fighter of random tier and random stat number
    rating = Fighter::TIERS.keys[rand(4)]
    stat_sum = rand(Fighter::TIERS[rating][0]..Fighter::TIERS[rating][1])
    @fighter = Fighter.new(rating: rating, stat_sum: stat_sum.to_s)

    # store rating and stat_sum in user session
    session[:new_rating] = rating
    session[:new_stat_sum] = stat_sum
  end

  # POST '/fighters/'
  def create
    new_fighter = Fighter.new(fighter_params)
    new_fighter.user = current_user # current_user method from devise to access logged-in user

    # if form statsum and rating dont match session re-render page
    if new_fighter.rating != session[:new_rating] || new_fighter.stat_sum != session[:new_stat_sum]
      render :new, status: :unprocessable_entity # TODO: Proper Error message - possibly a flash?
    end

    # if invalid inputs re-render page
    if new_fighter.save
      # redirect to '/fighters'
      redirect_to(fighters_path)
    else
      # need fighter instance again for re-rendering the page
      @fighter = new_fighter
      render :new, status: :unprocessable_entity
    end
  end

  # GET '/fighters/:id/edit'
  def edit
    # store fighter rating and stat sum in session
    session[:edit_rating] = rating
    session[:edit_stat_sum] = stat_sum
  end

  # PATCH/PUT '/fighters/:id/'
  def update
    fighter_to_edit = Fighter.new(fighter_params)
    fighter_to_edit.user = current_user

    if fighter_to_edit.rating != session[:edit_rating] || fighter_to_edit.stat_sum != session[:edit_stat_sum]
      render :edit, status: :unprocessable_entity # TODO: Proper Error message - possibly a flash?
    end

    if fighter_to_edit.update
      redirect_to(fighter_path(fighter_to_edit))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE '/fighters/:id'
  def destroy
    @fighter.destroy
    redirect_to(fighters_path)
  end

  private

  def fighter_params
    params.require(:fighter).permit(%i[name description price strength defense photo rating stat_sum])
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end
end
