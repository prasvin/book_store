class BooksController < ApplicationController
  BEST_SELLERS_LIMIT = 5

  # GET /books
  def index
    books = Book.all
    best_sellers_limit = params[:best_sellers_limit].presence || BEST_SELLERS_LIMIT

    respond_with books, serializer: Books::IndexSerializer, best_sellers_limit: best_sellers_limit
  end

  # GET /books/search
  def search
    books = Book.ransack(
      title_or_author_or_isbn_cont: params[:search_term]
    ).result

    respond_with books
  end
end
