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

  def update
    id = params[:id]
    @book = Book.find_by(id: id)
    if @book.update(book_params)
      # TODO: 完了後の動作
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @book = Book.find_by(id: id)
  end

  def show
    # 登録後の遷移先は/books/4で
    # rails routesには/books/:id のGETがbooks#showに対応しているとあった
    # この場合、params[:id]に4が入る
    id = params[:id]
    @book = Book.find_by(id: id)
  end

  private
  # Rails4からStrongParamaterと呼ばれる機能が追加されました。
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
