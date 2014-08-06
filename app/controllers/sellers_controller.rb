class SellersController < ApplicationController
  before_action :check_if_logged_in, except: [:new, :create]

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

  def check_if_logged_in
    unless current_user
      redirect_to root_path
    end
  end
end