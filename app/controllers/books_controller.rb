class BooksController < ApplicationController

  before_filter :authorize, only: [:new ]

  def index
    @books = Book.all
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to root_url, notice: 'Book create!'
    else
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_url, notice: 'Book deleted!'
  end

private
  def book_params
    params.require(:book).permit(:title, :author, :summary, :cover, { category_ids: [] })
  end
end
