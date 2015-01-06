class BaseController < ApplicationController

	private
		def admin_required
			if current_user.has_role? :admin
				return
			else
				access_denied
      		end
		end

		def user_login_required
			if current_user
				return
			else
				access_denied
			end
		end

		

		def access_denied
			flash[:alert] = "Access Denied"
      		redirect_to root_url and return
      	end
end

