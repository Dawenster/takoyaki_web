class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.all.order(:id)
  end

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
      redirect_to phrases_path
    else
      render "new"
    end
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def update
    @phrase = Phrase.find(params[:id])
    @phrase.assign_attributes(phrase_params)
    if @phrase.save
      redirect_to phrases_path
    else
      render "edit"
    end
  end

  def destroy
    phrase = Phrase.find(params[:id]).destroy
    redirect_to phrases_path
  end

  private

  def phrase_params
    params.require(:phrase).permit(
      :text,
      :hint,
      :_destroy
    )
  end
end