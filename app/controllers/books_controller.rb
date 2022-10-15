class BooksController < ApplicationController
  def new
    @book_new = Book.new
  end

  def create
    @books = Book.all
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
       redirect_to books_path, notice: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id), notice: "You have update book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
