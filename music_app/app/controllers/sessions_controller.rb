class SessionsController < ApplicationController 
  def create
    debugger 
    user = User.user_find_by_credentials(params[:user][:email], params[:user][:password])
    debugger 
    if user  
      session[:session_token] = user.reset_session_token 
      redirect_to user_url(user.id)  
    else
      flash.now[:errors] = ["Invalid ID Or Password"] 
      render :new 
    end
  end 

  def new
    render :new 
  end

  def destroy
    log_out 
    redirect_to new_session_url 
  end 




end 
