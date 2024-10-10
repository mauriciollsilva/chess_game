class Game < ApplicationRecord
  has_many :pieces # Define a relação entre Game e Piece
  attr_accessor :current_turn # Adicionando o atributo current_turn

  # Método que inicializa o jogo
  def initialize_game
    self.current_turn = 'white'  # Inicializa o turno como 'white' ou 'black'
    setup_pieces # Chama o método para configurar as peças após a inicialização
  end

  # Altera o turno após um movimento
  def switch_turn
    self.current_turn = (current_turn == 'white' ? 'black' : 'white')
    save
  end

  private

  # Método que configura as peças no tabuleiro
  def setup_pieces
    # Configura peões
    setup_player_pieces("white", 1)  # Posição (linha) para os peões brancos
    setup_player_pieces("black", 6)  # Posição (linha) para os peões pretos

    # Criando torres
    pieces.create(piece_type: "rook", color: "white", position: "0,0")  # Torre branca na posição [0,0]
    pieces.create(piece_type: "rook", color: "white", position: "0,7")  # Torre branca na posição [0,7]
    pieces.create(piece_type: "rook", color: "black", position: "7,0")  # Torre preta na posição [7,0]
    pieces.create(piece_type: "rook", color: "black", position: "7,7")  # Torre preta na posição [7,7]

    # Aqui você pode adicionar mais peças, como cavalos, bispos, etc.
  end

  # Método que configura os peões para um jogador (branco ou preto)
  def setup_player_pieces(color, row)
    8.times do |col|  # Cria 8 peões
      pieces.create(piece_type: "pawn", color: color, position: "#{row},#{col}")
    end
  end
end
