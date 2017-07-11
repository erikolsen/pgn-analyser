# == Schema Information
#
# Table name: moves
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  fen        :string
#  notation   :string
#  iteration  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Move < ApplicationRecord
  belongs_to :game
end
