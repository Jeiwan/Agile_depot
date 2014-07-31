class SellersController < ApplicationController
  def index
    @products = current_user.products
  end

  def new
  	@seller = Seller.new
  end

  def create
  	@seller = Seller.new(params_seller)

  	if @seller.save
  		redirect_to login_path, notice: 'Signed up!'
  	else
  		render "new"
  	end
  end

  private

  def params_seller
  	params.require(:seller).permit(:name, :email, :password, :password_confirmation)
  end
end