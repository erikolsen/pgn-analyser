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

require 'rails_helper'

RSpec.describe Move, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
