# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  date_played :string
#  opening     :string
#  player_id   :integer
#  result      :string
#  tags        :hstore
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Game < ApplicationRecord
  has_many :moves
  has_many :participations
  has_many :players, through: :participations
  has_one :winner, class_name: 'Player', foreign_key: 'player_id'
  validates :tags, uniqueness: true

  attr_accessor :pgn
end
