class BookShelfController < ApplicationController
  def show
    book_list = BookList.new
    book_shelf = BookShelf.new(book_list: book_list)
    render json: book_shelf.get.to_json
  end
end
