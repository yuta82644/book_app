class BookshelfController < ApplicationController
  def index
    @books = Book.all
  end
end
