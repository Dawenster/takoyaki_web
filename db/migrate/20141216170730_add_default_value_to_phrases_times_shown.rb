class AddDefaultValueToPhrasesTimesShown < ActiveRecord::Migration
  def change
    change_column :phrases, :times_shown, :integer, :default => 0
  end
end
