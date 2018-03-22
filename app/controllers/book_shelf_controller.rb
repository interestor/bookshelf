class BookShelfController < ApplicationController
  def show
    book_list = BookList.new
    book_shelf = BookShelf.new(book_list: book_list)
    render plain: book_shelf.print
  end
end
