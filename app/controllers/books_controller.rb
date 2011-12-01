class BooksController < ApplicationController

  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Book created"
      redirect_to books_path
    else
      render action: :new
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = "Book updated"
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end
  
end
