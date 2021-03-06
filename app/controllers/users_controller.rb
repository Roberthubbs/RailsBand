class UsersController < ApplicationController 
  before_action :require_logged_in, except: [:new,:create]


  def new
    @user = User.new 
    render :new
  end  
  
  def index 
    @users = User.all   
    render :index
  end   
  
  def show 
    @user = User.find(params[:id])
    render :show 
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else         
      flash.now[:errors] = ["Invalid email/password"]
      render :new  
    end     

  end  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url 
  end
  private 
    def user_params
      params.require(:user).permit(:email, :password)
    end    
end 