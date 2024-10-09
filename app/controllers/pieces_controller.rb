class PiecesController < ApplicationController
  #def index
  #end

 # def show
 # end

 # def new
  #end

  #def create
  #end
#end
class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.find(params[:id])
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)
    if @piece.save
      redirect_to @piece
    else
      render :new
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:type, :color, :position, :player_id) # Adicione mais parâmetros conforme necessário
  end
end
