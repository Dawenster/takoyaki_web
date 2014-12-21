class ApisController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_filter :allow_cors

  def game_details
    respond_to do |format|
      format.html {
        render :json => { 
          :guesses => 5,
          :love_points => Game.love_points
        }
      }
    end
  end

  def next_phrase
    respond_to do |format|
      format.html {
        render :json => { 
          :phrase => Phrase.next.to_json
        }
      }
    end
  end

  def finished_game
    respond_to do |format|
      game = Game.create(
        :phrase_id => params[:phrase_id],
        :guesses => params[:guesses],
        :guesses_left => params[:guesses_left]
      )

      format.html {
        render :json => { 
          :love_points => Game.love_points
        }
      }
    end
  end

  private

  def allow_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] =
      %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")

    head(:ok) if request.request_method == "OPTIONS"
  end
end