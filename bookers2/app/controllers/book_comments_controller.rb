class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id

    @user =  @book.user
    @book_comment = BookComment.new

    if comment.save
    flash[:notice] = "You have created comment successfully."
    else
      flash[:notice] = "空コメント不可"
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book = Book.find(@book_comment.book.id)
    @user =  @book.user
    @book_comment.destroy
    @book_comment = BookComment.new

    flash[:notice] = "You have deleted comment successfully."
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
