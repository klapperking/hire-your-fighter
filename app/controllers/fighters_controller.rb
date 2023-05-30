class FightersController < ApplicationController
  before_action :set_fighter, only: %i[show edit destroy]

  def index
    @fighters = Fighter.all
  end

  def show
  end
  
  # GET '/fighters/new'
  def new
    @fighter = Fighter.new
  end

  # POST '/fighters/'
  def create
    new_fighter = Fighter.new(fighter_params)

    if new_fighter.save
      # redirect to '/fighters'
      redirect_to(fighters_path)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET '/fighters/:id/edit'
  def edit; end

  # PATCH/PUT '/fighters/:id/'
  def update
    fighter_to_edit = Fighter.new(fighter_params)
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
    params.require(:fighter).permit(%i[name description price strength defense photo])
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end
end
