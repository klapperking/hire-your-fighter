class FightersController < ApplicationController
  before_action :set_fighter, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index]

  def index
    @fighters = Fighter.all
    if params[:query].present?
      @fighters = Fighter.search_by_name_description_and_rating(params[:query])
    end
  end

  def show
    @booking = Booking.new
  end

  # GET '/fighters/new'
  def new
    # if user has max_fighters (5) already its not possible to create a new fighter
    if current_user.fighters.count == 5
      flash[:notice] = 'You can not create more fighters'
      redirect_to(fighters_path)
    end

    # if session vars and are default, we roll; else take existing
    if new_session? || default_fighter_vars?
      rating = Fighter::TIERS.keys[rand(4)] # roll tier
      max_stat = rand(Fighter::TIERS[rating][0]...Fighter::TIERS[rating][1]) # roll stat number within tier

      fighter_stats = {
        rating: rating,
        max_stat: max_stat,
        # roll individual stats
        strength: rand(Fighter::TIERS[rating][0]...max_stat),
        defense: rand(Fighter::TIERS[rating][0]...max_stat),
        speed: rand(Fighter::TIERS[rating][0]...max_stat),
      }

      # calculate fighter price
      stat_sum = fighter_stats[:strength] + fighter_stats[:strength] + fighter_stats[:strength]
      fighter_stats[:price] = stat_sum * 3

      # update session values
      session[:fighter_stats] = fighter_stats

    # if session values exist and are non-default
    else
      fighter_stats = session[:fighter_stats]
    end

    # create a new fighter instance with generated values
    @fighter = Fighter.new(fighter_stats)
  end

  # POST '/fighters/'
  def create
    new_fighter = Fighter.new(fighter_params)
    new_fighter.user = current_user # current_user method from devise to access logged-in user

    # if generated form values were changed re-render page
    session[:fighter_stats].each do |stat_key, stat_val|
      if stat_val != new_fighter[stat_key]
        @fighter = new_fighter
        flash[:notice] = "You changed your allocated stats (Bad person!)"
        render :new, status: :unprocessable_entity # TODO: Proper Error message - possibly a flash?
        return
      end
    end

    # if save successful, reset session values for #new; else keep them (prevent re-rolling)
    if new_fighter.save
      session[:fighter_params] = {}
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
    session[:edit_rating] = @fighter.rating
    session[:edit_stat_sum] = @fighter.stat_sum
  end

  # PATCH/PUT '/fighters/:id/'
  def update
    # remove injected extra-params if they are there
    fighter_params.to_hash.except!(%i[price strength defense photo rating stat_sum])

    # add user
    fighter_params[:user] = current_user

    if @fighter.update(fighter_params)
      redirect_to(fighter_path(@fighter))
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
    params.require(:fighter).permit(%i[name description photo rating price max_stat strength defense speed])
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  def new_session?
    !session.key?(:fighter_stats)
  end

  def default_fighter_vars?
    session[:fighter_stats] == {}
  end
end
