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
      puts "Current Turn: #{@game.current_turn}"  # Linha de depuração (opcional)
      redirect_to @game
    else
      render :new
    end
  end

  def move_piece
    @game = Game.find(params[:id])
    piece = @game.pieces.find(params[:piece_id]) # ID da peça a ser movida

    # Lógica para mover a peça - substitua esta parte pela lógica que você deseja usar
    # Exemplificando como atualizar a posição da peça
    # piece.position = 'new_position' # Aqui você deve definir a nova posição
    piece.save # Salva a alteração (deve ser adaptado conforme a lógica do jogo)

    # Alternar o turno após mover
    @game.switch_turn

    redirect_to @game, notice: "Peça movida com sucesso." # Redireciona para a página do jogo
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_date)
  end
end
