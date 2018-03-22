class BookList
  # データベースに登録されているBookを全てくれるやつ
  def get
    Book.all
  end
end
