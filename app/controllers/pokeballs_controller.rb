class PokeballsController < ApplicationController
  before_action :set_pokemon, only: %i[new create]

  def new
    @pokeball = Pokeball.new
  end

  def create
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    if rand < 0.5
      flash[:alert] = "Oh no, the pokemon escaped. Try again!"
      render "pokemons/show", status: :unprocessable_entity
      return
    end

    if @pokeball.save
      redirect_to @pokeball.trainer
    else
      render "pokemons/show", status: :unprocessable_entity
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:location, :caught_on, :pokemon_id, :trainer_id)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
