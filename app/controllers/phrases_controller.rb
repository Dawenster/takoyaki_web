class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.all.order(:id)
  end

  def new
    @phrase = Phrase.new
  end

  def create
    
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def update
    
  end

  def destroy
    phrase = Phrase.find(params[:id]).destroy
    redirect_to phrases_path
  end
end