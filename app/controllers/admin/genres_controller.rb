class Admin::GenresController < ApplicationController
  #アクションが動く前にset_genreメソッドを実行
  before_action :set_genre, only: [:edit, :update, :destroy]
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(category_params)
    if @genre.save
      redirect_to genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
  end
  
  def update
    if @genre.update(category_params)
      redirect_to genres_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @genre.destroy
    redirect_to genres_path
  end
  
    private
  　#set_genreメソッド
    def set_genre
      @genre = Genre.find(params[:id])
    end
    
    #ストロングパラメーター
    def genre_params
      params.require(:genre).permit(:name)
    end
  
end
