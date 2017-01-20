class BooksController < ApplicationController

  before_filter :authorize, only: [:new, :edit, :update, :delete, :drafts ]

  def index
    @books = Book.all.last_week.not_drafts
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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to root_url, notice: "You don't have a root!"
    else
      if @book.update(book_params)
        redirect_to root_url, notice: "Book updated!"
      else
        render 'edit'
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_url, notice: 'Book deleted!'
  end

  def drafts
    @books = current_user.books.drafts
  end

private
  def book_params
    params.require(:book).permit(:title, :author, :summary, :cover, { category_ids: [] }, :draft)
  end
end
