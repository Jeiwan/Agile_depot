class Seller < ActiveRecord::Base

	has_many :products

	has_secure_password

	validates :email,		presence: true, uniqueness: true
	validates :password,	presence: true, confirmation: true, length: { in: 6..32 }

end
