# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ApplicationRecord
  has_many :participations
  has_many :games, through: :participations
end
