class BookshelfController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_review
    @book = Book.find(params[:id])
    @book.update(review: params[:review])
    redirect_to bookshelf_path(@book), notice: '感想を書きました'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to bookshelf_path, notice: '感想を更新しました'
    else
      render :edit, alert: '感想の更新に失敗しました'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to bookshelf_index_path, notice: '本を削除しました'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :published_date, :image_url, :review)
  end
end
