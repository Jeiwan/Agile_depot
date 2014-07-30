module ApplicationHelper
	def page_title title
		@page_title = title || "Depot"
	end

	def current_page page
		@current_page = page || nil
	end
end
