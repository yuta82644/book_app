class BooksController < ApplicationController

def search
    if params[:query].nil?
      return
    elsif params[:query].blank?
      flash.now[:danger] = '検索キーワードが入力されていません'
    else
      url = "https://www.googleapis.com/books/v1/volumes"
      text = params[:query]
      res = Faraday.get(url, q: text, langRestrict: 'ja', maxResults: 20)
      @books = JSON.parse(res.body)
    end
  end

end
