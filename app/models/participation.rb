# == Schema Information
#
# Table name: participations
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  player_id  :integer
#  color      :string
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participation < ApplicationRecord
  belongs_to :player
  belongs_to :game
end
