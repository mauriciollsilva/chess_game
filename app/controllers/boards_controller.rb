class BoardsController < ApplicationController
 # def index
  #end

  #def show
  #end

  #def new
  #end

  #def create
  #end
#end


class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:game_id) # Adicione mais parâmetros conforme necessário
  end
end
