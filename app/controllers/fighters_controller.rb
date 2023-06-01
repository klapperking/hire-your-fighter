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
      # roll rating
      rating = Fighter::TIERS.keys[rand(4)]
      stat_sum = rand(Fighter::TIERS[rating][0]..Fighter::TIERS[rating][1])

      # update session values
      session[:new_rating] = rating
      session[:new_stat_sum] = stat_sum

    # if session values exist and are non-default
    else
      rating = session[:new_rating]
      stat_sum = session[:new_stat_sum]
    end

    # create a new fighter instance with generated values
    @fighter = Fighter.new(rating: rating, stat_sum: stat_sum)
  end

  # POST '/fighters/'
  def create
    new_fighter = Fighter.new(fighter_params)
    new_fighter.user = current_user # current_user method from devise to access logged-in user

    # if generated form values were changed re-render page
    if new_fighter.rating != session[:new_rating] || new_fighter.stat_sum.to_i != session[:new_stat_sum]
      @fighter = new_fighter
      flash[:notice] = "You changed your allocated stats (Bad person!)"
      render :new, status: :unprocessable_entity
    end

    # if save successful, reset session values for #new; else keep them (prevent re-rolling)
    if new_fighter.save
      session[:new_rating] = "new_creation"
      session[:new_stat_sum] = 0
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
    params.require(:fighter).permit(%i[name description price strength defense photo rating stat_sum])
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  def new_session?
    !(session.key?(:new_rating) && session.key?(:new_stat_sum))
  end

  def default_fighter_vars?
    session[:new_rating] == "new_creation" && session[:new_stat_sum].zero?
  end
end
