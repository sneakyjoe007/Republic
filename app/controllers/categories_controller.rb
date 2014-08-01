class CategoriesController < ApplicationController

	layout "admin"

	def index
	end

	def new
		@categories = Category.new
	end

	def create
		@categories = Category.new(admin_params)
    
	    respond_to do |format|
	      if @category.save
	        format.html { redirect_to @category, notice: 'Category was successfully created.' }
	        format.json { render :show, status: :created, location: @category }
	      else
	        format.html { render :new }
	        format.json { render json: @category.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private 

	def cat_params
		params.require(:category).permit(:name)
	end

end