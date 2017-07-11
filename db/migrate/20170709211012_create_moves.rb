class CreateMoves < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.string :fen
      t.string :notation
      t.integer :iteration

      t.timestamps
    end
  end
end
