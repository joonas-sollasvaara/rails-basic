class BooksController < ApplicationController

  def index
    respond_to do |format|
      format.atom { @books = Book.order('created_at DESC') }
      format.html do 
      	@books = Book.latest
      	@popular_books = Book.popular.all
      end
      format.xml  { render xml: Book.all }
      format.json { render json: Book.all }
    end
  end
  
  def search
    @books = case params[:by]
      when 'isbn'    then Book.search_by_isbn(params[:query])
      when 'authors' then Book.search_by_authors(params[:query])
      else                Book.search_by_title(params[:query])
    end
    
    respond_to do |format|
      format.atom { render :index }
      format.html
      format.xml { render xml: @books }
      format.json { render json: @books }
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @book_reservation = @book.reserved
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
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end
end
