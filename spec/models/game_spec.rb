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

require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
