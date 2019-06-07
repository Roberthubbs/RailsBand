class SessionsController < ApplicationController 

  def create 
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password])

    if user.nil?
      flash.now[:errors] = ["invalid username/password"]
      render :new 
    else        
      login!(user)
      redirect_to user_url(user)
    end 
  end  


  def destroy
    log_out!
    redirect_to users_url
  end

  

end 