class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :game_id
      t.integer :player_id
      t.string :color
      t.string :rating

      t.timestamps
    end
  end
end
