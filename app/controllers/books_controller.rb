class BooksController < ApplicationController
  def index
    @books = Book.order(:id).page params[:page]
  end
  def show
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    to_keep = params[:to_keep]
    logger.info("Keeping #{@book.title}: #{to_keep}")
    previous = {id: @book.id, title: @book.title.truncate(50), choice: to_keep}
    redirect_to @book.next, flash: {previous: previous} # http://guides.rubyonrails.org/action_controller_overview.html#session
  end
end
