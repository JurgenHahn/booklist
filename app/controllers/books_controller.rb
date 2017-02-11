class BooksController < ApplicationController

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv do
        csv_format = Book.generate_csv(@books)
        render plain: csv_format
      end
    end

  end

end
