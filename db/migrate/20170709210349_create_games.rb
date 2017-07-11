class CreateGames < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :games do |t|
      t.string :date_played
      t.string :opening
      t.integer :player_id
      t.string :result
      t.hstore :tags

      t.timestamps
    end
  end
end
