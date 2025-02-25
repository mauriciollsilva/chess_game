#class PlayersController < ApplicationController
  #def index
#  end

 # def show
 # end

#  def new
 # end

 # def create
 # end
#end
class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player
    else
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :game_id) # Adicione mais parâmetros conforme necessário
  end
end
