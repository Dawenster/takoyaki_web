class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :guesses
      t.integer :guesses_left
      t.integer :phrase_id

      t.timestamps
    end
  end
end
