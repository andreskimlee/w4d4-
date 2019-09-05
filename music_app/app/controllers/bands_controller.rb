class BandsController < ApplicationController
  def strong_params
    params.require(:band).permit(:name) 
  end 


  def index
    @bands = Band.all 
    render :index 
  end 

  def create
    @new_band = Band.new(name: params[:band][:name])
    if @new_band.save! 
      redirect_to band_url(@new_band.id) 
    else
      flash.now[:errors] = "Invalid Band Name!"
      render :new 
    end 
  end

  def new
    render :new  
  end 

  def edit #takes you to the edit page 
    
  end 

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end 

  def destroy

  end 

  def update #updates database with new band info 

  end 

end 