class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :text
      t.text :hint
      t.integer :times_shown

      t.timestamps
    end
  end
end
