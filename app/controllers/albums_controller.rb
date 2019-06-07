class AlbumsController < ApplicationController 


  def new 
    @album = Album.new 
    render :new
  end

  def index 
    @albums = Album.all 
  end    

  def show 
    @album = Album.find(params[:band_id][:id])
  end    

  
  def create 
    @album = Album.new(album_params)
      if @album.save 
        redirect_to album_url(@album) 
      else         
        flash.now[:errors] = ["Invalid album name"]
        render :new  
      end
  end    

  private 
  def album_params
    params.require(:album).permit(:title, :year, :band_id)
  end   

end   