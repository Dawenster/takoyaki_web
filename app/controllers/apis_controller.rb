class ApisController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_filter :allow_cors

  def game_details
    respond_to do |format|
      format.html {
        render :json => { 
          :guesses => 5
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

  private

  def allow_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] =
      %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")

    head(:ok) if request.request_method == "OPTIONS"
  end
end