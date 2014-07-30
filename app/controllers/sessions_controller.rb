class SessionsController < ApplicationController
  def new
  end

  def create
    puts "EMMAIL#{params}"
  	@seller = Seller.authenticate(params[:email], params[:password])
  	if @seller
  		session[:user_id] = @seller.id
  		redirect_to dashboard_path, notice: 'Logged in!'
  	else
  		flash.now.alert = "Invalid email or password!"
  		render "new"
  	end
  end

end
