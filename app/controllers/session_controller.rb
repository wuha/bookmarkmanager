class SessionController < ApplicationController

	def new
	end
	
	def create
		
		user=User.find_by_email(params[:email])
		
		if user && user.authenticate(params[:password])
			session[:user_id]=user.id
			redirect_to bookmarks_path, notice: "Sie sind jetzt eingeloggt"
		else
			flash.now.alert = "Benutzer/Passwort falsch!"
			render "new"
		end
		
	end
	
	def destroy
	
		session[:user_id]=nil
		redirect_to root_path, notice: "Sie wurden abgemeldet"
	
	end

end
