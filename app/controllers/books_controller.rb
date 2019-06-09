class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: t('.created')
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t('.destroyed')
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
