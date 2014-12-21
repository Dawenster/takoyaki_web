class Game < ActiveRecord::Base
  belongs_to :phrase

  def self.love_points
    Game.sum("guesses_left") - Game.where(:guesses_left => 0).count
  end
end