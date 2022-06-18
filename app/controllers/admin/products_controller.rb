class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_homes_top_path
  end


  def show
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
  end
  
  
  
  
  
end
