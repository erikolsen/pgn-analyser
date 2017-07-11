require_relative '../../lib/pgn_parser.rb'
require 'rails_helper'

RSpec.describe PgnParser do
  describe '#create_models' do
    let(:one_pgn) { File.read(Dir.pwd + '/spec/pgns/one_game.pgn') }
    let(:starting_fen) { "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1" }
    context 'creates modesl from pgns' do
      subject { PgnParser.new(one_pgn) }
      it 'creates the games, players, participations, moves' do
        subject.create_models!
        game = Game.last
        expect(game.result).to eq('1-0')
        expect(game.opening).to eq("Philidor's defence")
        expect(game.winner.name).to eq('Oldpath')
        expect(game.date_played).to eq('2017.06.23')
        first_move = game.moves.first
        expect(first_move.notation).to eq('e4')
        expect(first_move.fen).to eq(starting_fen)
        expect(first_move.iteration).to eq(1)
        expect(game.players.map(&:name)).to include 'Oldpath'
      end
    end
  end
end
