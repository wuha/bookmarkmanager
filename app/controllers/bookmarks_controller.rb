#encoding: utf-8

class BookmarksController < ApplicationController
	
	before_filter :require_login

	
	def index
		
		@bookmarks=current_user.bookmarks
		
	end
	
	def new
		
		@bookmark=current_user.bookmarks.build
	
	end
	
	def create
		
		@bookmark=current_user.bookmarks.build(params[:bookmark])
		
		if @bookmark.save
		
			redirect_to bookmarks_path, notice: t("messages.new_bookmark")
		else
			render "new"
		end
		
	end
	
	def edit
		
		@bookmark=current_user.bookmarks.find(params[:id])
	
	end
	
	
	def update
		
		@bookmark=current_user.bookmarks.find(params[:id])
		
		if @bookmark.update_attributes(params[:bookmark])
			redirect_to bookmarks_path, notice: t("messages.update_bookmark")
		else
			render "edit"
		end
	
	end
	
	def destroy
	
		@bookmark=current_user.bookmarks.find(params[:id])
		@bookmark.destroy
		
		flash[:notice]=t("messages.delete_bookmark")
		redirect_to bookmarks_path
	
	end
	
	
	def show
		#Liest �ber Params die ID des zu holenden Datensatzes aus der URL und sucht mit find danach.
		@bookmark=current_user.bookmarks.find(params[:id])

	end
	
	private
	
	def require_login
		unless user_signed_in?
			redirect_to login_path, alert: t("messages.user_not_logged_in")
		end
	end
	
	
	
	
	
	
end
