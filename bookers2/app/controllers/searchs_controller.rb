class SearchsController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      @oouser = params[:word]
      render 'result'
    else
      @books = Book.looks(params[:search], params[:word])
      @oobook = params[:word]
      render 'result'
    end
  end


end
