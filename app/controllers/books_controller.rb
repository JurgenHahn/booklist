class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv do
        render plain: Book.generate_csv(@books)
      end
      format.json do
        render json: @books.map { |book|
          #filtering what we return back to the user
          {
            title: book.title,
            author: book.author,
            already_read: book.already_read
          }

        }
      end


    end

  end

end
