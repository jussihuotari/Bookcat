class BooksController < ApplicationController
  def index
    @books = Book.order(:id).page params[:page]
  end
end
