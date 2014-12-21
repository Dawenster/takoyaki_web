class Phrase < ActiveRecord::Base
  before_create :set_times_shown

  has_many :games

  def self.next
    random_min_phrase = Phrase.random_min_phrase
    random_min_phrase.increment_times_shown
    return random_min_phrase
  end

  def self.random_min_phrase
    Phrase.where(:times_shown => Phrase.min_times_shown).sample
  end

  def self.min_times_shown
    Phrase.minimum(:times_shown)
  end

  def increment_times_shown
    self.update_attributes(:times_shown => self.times_shown + 1)
  end

  private

  def set_times_shown
    self.times_shown = Phrase.min_times_shown
  end
end