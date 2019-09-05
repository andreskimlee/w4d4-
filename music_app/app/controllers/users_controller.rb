class UsersController < ApplicationController
  def new 
    render :new 
  end 

  def create 
    @user = User.new(strong_params)
    if @user.save
      login!(@user) 
      redirect_to user_url(@user.id) 
    else 
      flash.now[:errors] = @user.errors.full_messages ##Memorize this. 
      render :new 
    end 
  end 

  def show 
    render :show 
  end 

  def strong_params
    params.require(:user).permit(:email, :password) 
  end 



end 