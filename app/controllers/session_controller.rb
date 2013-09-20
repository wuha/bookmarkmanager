class SessionController < ApplicationController

	def new
	end
	
	def create
		
		user=User.find_by_email(params[:email])
		
		if user && user.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to bookmarks_path, notice: t("messages.user_login")
		else
			flash.now.alert = t("messages.login_failure")
			render "new"
		end
		
	end
	
	def destroy
	
		session[:user_id]=nil
		redirect_to root_path, notice: t("messages.user_logout")

	
	end

end
