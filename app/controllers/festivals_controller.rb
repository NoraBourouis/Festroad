class FestivalsController < ApplicationController
  def index 
    @fests = Fest.where(nil)
    if params[:advanced]
      @fests = @fests.music(params[:music], @fests) if params[:music].present?
      @fests = Fest.location(params[:location], @fests) if params[:location].present?
      @fests = Fest.start_date(params[:start_date], @fests) if params[:start_date].present?
    else
      @fests = Fest.title(params[:title]) if params[:title].present?   
    end  
    @fest = Fest.all
    gon.fest = @fest
  end

  def show
    
  end
end
