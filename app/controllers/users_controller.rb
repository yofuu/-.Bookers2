class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new=Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
    @book_new =Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
