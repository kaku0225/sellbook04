class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(clean_book)
    if @book.save
      redirect_to root_path, notice:'新增成功'
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(clean_book)
      redirect_to root_path, notice:'編輯成功'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path, notice:'刪除成功'
  end



  private
  def clean_book
    params.require(:book).permit(:name, :author, :price, :comment)
  end
end