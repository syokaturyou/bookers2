class UsersController < ApplicationController

  def create
    @newbook = Book.new(book_params)
    @book.user_id = current_user.id
      if @newbook.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
      else
      @books = Book.all
      render 'book#index'
      end
  end

  def index
    @user = current_user
    @newbook = Book.new
    @users = User.all
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @users = User.all
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def delete
   flash[:notice] = "Signed out successfully."
  end

   private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
