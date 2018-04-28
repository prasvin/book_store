class Books::IndexSerializer < ActiveModel::Serializer
  attributes :overall_sales, :total_books_sold, :top_selling_books, :books

  def overall_sales
    Order.sum(:amount)
  end

  def total_books_sold
    Book.total_sold
  end

  def top_selling_books
    limit = instance_options[:best_sellers_limit].to_i
    Book.best_sellers(limit)
  end

  def books
    ActiveModelSerializers::SerializableResource.new(
      object,
      each_serializer: BookSerializer
    )
  end
end
