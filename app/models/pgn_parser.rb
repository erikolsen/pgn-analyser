require 'chess_openings'

class PgnParser
  def initialize(pgn)
    @pgn = pgn
    @pgns = PGN.parse(pgn)
  end

  def create_models!
    @pgns.each do |pgn|
      ActiveRecord::Base.transaction do
        white = Player.find_or_create_by(name: pgn.tags['White'])
        black = Player.find_or_create_by(name: pgn.tags['Black'])
        game = Game.new(date_played: pgn.tags['Date'],
                        result: pgn.tags['Result'],
                        tags: pgn.tags,
                        opening: opening_from_moves(pgn.moves),
                        player_id: winner_from_tags(pgn.tags, white, black).try(:id))
        if game.save
          Participation.create!(game_id: game.id,
                                player_id: white.id,
                                color: 'White',
                                rating: pgn.tags['WhiteElo'])
          Participation.create!(game_id: game.id,
                                player_id: black.id,
                                color: 'Black',
                                rating: pgn.tags['BlackElo'])
          pgn.moves.each_with_index do |pgn_move, idx|
            Move.create!(game_id: game.id,
                         fen: pgn.fen_list[idx],
                         notation: pgn_move.notation,
                         iteration: idx + 1)
          end
        else
          next
        end
      end
    end
  end

  def opening_from_moves(moves)
    chess_openings.from_moves(moves.map(&:notation)).name
  end

  def winner_from_tags(tags, white, black)
    case tags['Result']
    when '1-0'
      white
    when '0-1'
      black
    else
      nil
    end
  end



  def chess_openings
    @chess_openings ||= ChessOpenings.new
  end
end
