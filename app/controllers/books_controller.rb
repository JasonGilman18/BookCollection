class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    #show assigns @book to the Book that was clicked on.
    #it finds it by pulling the id from the uri path
    def show
        @book = Book.find(params[:id])
    end

    #instantiates a new book object but does not save it to db.
    #presents the form to the user
    def new
        @book = Book.new
    end

    #instantiates and saves a book with data from the input form.
    def create
        @book_params = params[:book]
        @date = Date.new(@book_params["published_date(1i)"].to_i, @book_params["published_date(2i)"].to_i, @book_params["published_date(3i)"].to_i)
        @book = Book.new(title: @book_params[:title], author: @book_params[:author], genre: @book_params[:genre], price: @book_params[:price], published_date: @date)
    
        if @book.save
            redirect_to root_path, notice: "The book \"#{@book.title}\" has been ADDED!"
        else
            render :new
        end
    end

    #when upating a book, fetch the book and present a form
    def edit
        @book = Book.find(params[:id])
    end

    #try to save the form from the edit action if it does go to the details of the book
    def update
        @book_params = params[:book]
        @book = Book.find(params[:id])
        @date = Date.new(@book_params["published_date(1i)"].to_i, @book_params["published_date(2i)"].to_i, @book_params["published_date(3i)"].to_i)

        if @book.update(title: @book_params[:title], author: @book_params[:author], genre: @book_params[:genre], price: @book_params[:price], published_date: @date)
            redirect_to root_path, notice: "The book \"#{@book.title}\" has been UPDATED!"
        else
            render :edit
        end
    end

    #present the user with a page to confirm deletion
    def remove
        @book = Book.find(params[:id])
    end

    #actually remove the book
    def destroy
        @book = Book.find(params[:id])
        @book.destroy

        redirect_to root_path, notice: "The book \"#{@book.title}\" has been REMOVED!"
    end
end
