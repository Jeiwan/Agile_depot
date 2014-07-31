class SessionsController < ApplicationController
  def new
  end

  def create
    @seller = Seller.find_by_email(params[:email])
  	if @seller && params[:password] == params[:password_confirmation] && @seller.authenticate(params[:password])
  		session[:user_id] = @seller.id
  		redirect_to dashboard_path, notice: 'Logged in!'
  	else
  		flash.now.alert = "Invalid email or password!"
  		render "new"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to dashboard_path
  end

end
