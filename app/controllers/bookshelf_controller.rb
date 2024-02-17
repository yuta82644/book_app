
class BookshelfController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  
  private

  def book_params
    params.require(:book).permit(:title, :author, :published_date, :image_url, :review)
  end
end
