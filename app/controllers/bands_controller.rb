class BandsController < ApplicationController 

  def index 
    @bands = Band.all 
  end    

  def new 
    @band = Band.new 
  end    

  def show 
    @band = Band.find(params[:id])
    render :show 
  end


  def create 
    @band = Band.new(band_params)
    if @band.save 
      redirect_to band_url(@band) 
    else         
      flash.now[:errors] = ["Invalid band name"]
      render :new  
    end
  end    


  private 
  def band_params 
    params.require(:band).permit(:name)
  end    
end