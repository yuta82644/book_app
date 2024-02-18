class BooksController < ApplicationController
before_action :authenticate_user!
def search
    if params[:query].nil?
      return
    elsif params[:query].blank?
      flash.now[:danger] = '検索キーワードが入力されていません'
    else
      url = "https://www.googleapis.com/books/v1/volumes"
      text = params[:query]
      res = Faraday.get(url, q: text, langRestrict: 'ja', maxResults: 30)
      @books = JSON.parse(res.body)
      @books = {} unless @books['items'].present?
    end
  end
  def add_to_bookshelf
      @book = current_user.books.new(book_params)
      if @book.save
        redirect_to bookshelf_index_path, notice: '本を本棚に追加しました'
      else
        flash.now[:alert] = '本の追加に失敗しました'
        render 'search'
      end
    end

private

    def book_params
      params.permit(:title, :author, :published_date, :image_url)
    end
  end

