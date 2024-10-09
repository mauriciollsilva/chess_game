class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      @game.initialize_game  # Inicializa o jogo e configura as peças
      redirect_to @game
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_date)
  end
end
