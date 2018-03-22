class BookShelf
  def initialize(book_list: nil)
    @book_list = book_list
  end

  def print
    # 下のprintはbookのprint
    get.map(&:print).join("<br />")
  end

  def get
    # .filter { |book| book.is_in_shelf }
    # https://qiita.com/kenzan100/items/6344766167299b9f7e91
    @book_list.get.to_a.select(&:is_in_shelf)
  end
end
