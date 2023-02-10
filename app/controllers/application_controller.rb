class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/books" do
    books = Book.all
    books.to_json
  end
  get "/books/:id" do
    book = Book.find(params[:id])
    reviews = book.reviews
    {book: book, reviews: reviews}.to_json
  end
  post "/books" do
    book = Book.create(title: params[:title], image: params[:image], author: params[:author], summary: params[:summary])
    book.to_json
  end

  delete "/books/:id" do
    book = Book.find(params[:id])
    book.destroy
    book.delete_with_reviews
    book.to_json
  end

  get "/reviews" do
    reviews = Review.all
    reviews.to_json
  end
  get "/reviews/:id" do
    review= Review.find(params[:id])
    review.to_json
  end

  post "/reviews" do
    review = Review.create(name: params[:name], comment: params[:comment], score: params[:score], book_id: params[:book_id])
    review.to_json
  end
  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end
end
