class BooksController < ApplicationController

  def index
    Book.all
  end
end
