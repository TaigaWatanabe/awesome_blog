class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Logged in success!"
      log_in user
      redirect_to user
    else      
      flash[:danger] = "Login failed"
      render 'new'
    end
  end

  def destroy
    logout 
    redirect_to root_url
  end
end
