class SellersController < ApplicationController
  def index
  end

  def new
  	@seller = Seller.new
  end

  def create
  	@seller = Seller.new(params_seller)

  	if @seller.save
  		redirect_to log_in_path, notice: 'Signed up!'
  	else
  		render "new"
  	end
  end

  private

  def params_seller
  	params.require(:seller).permit(:email, :password, :password_confirmation)
  end
end