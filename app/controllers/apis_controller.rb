class ApisController < ApplicationController
  def game_details
    respond_to do |format|
      format.json {
        render :json => { 
          :guesses => 5
        }
      }
    end
  end

  def next_phrase
    respond_to do |format|
      format.json {
        render :json => { 
          :phrase => Phrase.next.to_json
        }
      }
    end
  end
end