#encoding: utf-8

class BookmarksController < ApplicationController
	
	def index
		
		@bookmarks=Bookmark.all
		
	end
	
	def new
		
		@bookmark=Bookmark.new
	
	end
	
	def create
		
		@bookmark=Bookmark.new(params[:bookmark])
		
		if @bookmark.save
		
			redirect_to bookmarks_path, notice: "Bookmark erfolgreich angelegt"
		else
			render "new"
		end
		
	end
	
	def edit
		
		@bookmark=Bookmark.find(params[:id])
	
	end
	
	
	def update
		
		@bookmark=Bookmark.find(params[:id])
		
		if @bookmark.update_attributes(params[:bookmark])
			redirect_to bookmarks_path, notice: "Erfolgreich aktualisiert"
		else
			render "edit"
		end
	
	end
	
	def destroy
	
		@bookmark=Bookmark.find(params[:id])
		@bookmark.destroy
		
		flash[:notice]="Bookmark geloescht!"
		redirect_to bookmarks_path
	
	end
	
	
	def show
		#Liest über Params die ID des zu holenden Datensatzes aus der URL und sucht mit find danach.
		@bookmark=Bookmark.find(params[:id])

	end
	
end
