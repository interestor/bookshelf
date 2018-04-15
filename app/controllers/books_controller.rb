class BooksController <  ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    # モデルのバリデーションを行って、
    # データベースへの保存を試みる
    # いずれかが失敗すればfalseを返す、成功すればtrueを返す
    # 例外を返してくれる、@book.save!という関数もある（調べてみてください）
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
    # 以下のコードと同じ意味
    #  @book.title = book_params[:title]
    #  @book.author = book_params[:author]
    #  @book.save
    if @book.update(book_params)
      redirect_to @book, notice: "本を編集しました。"
      # render :new
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @book = Book.find_by(id: id)
  end

  def destroy
    id = parmas[:id]
    @book = Book.find_by(id: id)
    # hogeで削除できるhogeを探す！
    if @book.destroy(book_params)
      redirect_to @book, notice: "本を削除しました。"
    else
      # 削除失敗処理
      render :new
    end
  end

  def show
    # 登録後の遷移先は/books/4で
    # rails routesには/books/:id のGETがbooks#showに対応しているとあった
    # この場合、params[:id]に4が入る
    id = params[:id]
    @book = Book.find_by(id: id)
  end

  def move_to_book_shelf
    id = params[:id]
    @book = Book.find_by(id: id)
    #:is_in_shelf=1とする処理？

  end



  private
  # Rails4からStrongParamaterと呼ばれる機能が追加されました。
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
