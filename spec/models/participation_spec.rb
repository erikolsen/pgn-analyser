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

require 'rails_helper'

RSpec.describe Participation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
