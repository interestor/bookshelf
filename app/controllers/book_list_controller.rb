class BookListController < ApplicationController
  def show
    book_list = BookList.new
    books = book_list.get.to_json
    render json: books
  end
end
