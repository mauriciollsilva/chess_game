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

  def move
    @piece = Piece.find(params[:id])
    new_position = params[:position]
    game = @piece.game  # Adiciona a referência ao jogo associado à peça

    # Verifica se é a vez do jogador correto
    if @piece.color != game.current_turn
      redirect_to game_path(game), alert: 'Não é a sua vez de jogar!'
      return
    end

    if @piece.valid_move?(new_position)
      @piece.move_to(new_position)
      game.switch_turn  # Altera o turno após um movimento válido
      redirect_to game_path(game), notice: 'Peça movida com sucesso.'
    else
      redirect_to game_path(game), alert: 'Movimento inválido.'
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:type, :color, :position, :player_id)  # Adicione mais parâmetros conforme necessário
  end
end
