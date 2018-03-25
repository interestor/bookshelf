class BooksController <  ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # @book.id => 4
      # @bookはbook_path(@book)に自動変換される
      redirect_to @book, notice: "本を登録しました。"
    else
      # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
      render 'new'
    end
  end

  private
  # Rails4からStrongParamaterと呼ばれる機能が追加されました。
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
