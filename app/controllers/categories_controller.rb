class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    # binding.pry
    @category = Category.find(params[:id])
  end

end
