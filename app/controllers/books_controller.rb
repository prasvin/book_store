class BooksController < ApplicationController
  # GET /books/search
  def search
    books = Book.ransack(
      title_or_author_or_isbn_cont: params[:search_term]
    ).result

    respond_with books
  end
end
