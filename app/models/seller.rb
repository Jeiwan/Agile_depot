class Seller < ActiveRecord::Base
	attr_accessor :password

	before_save :encrypt_password

	validates :email,		presence: true, uniqueness: true
	validates :password,	presence: true, confirmation: true, length: { in: 6..32 }

	def self.authenticate(email, password)
	    puts "EMAIL:#{email}"
		seller = find_by_email(email)
	    puts ">>>#{seller}"
		if seller && seller.password_hash == BCrypt::Engine.hash_secret(password, seller.password_salt)
			seller
		else
			nil
		end

	end

	private

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
