class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.where(is_active: true).order(created_at: :desc).limit(4)
  end

  def about
  end

end
