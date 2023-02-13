class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  def format_as_json(book)
    book.to_json(:include => :reviews)
  end

  get "/books" do
    books = Book.all
    format_as_json(books)
  end

  post "/books" do
    book = Book.create(title: params[:title], image: params[:image], author: params[:author], summary: params[:summary])
    format_as_json(book)
  end

  delete "/books/:id" do
    book = Book.find(params[:id])
    book.destroy
    book.delete_with_reviews
    book.to_json
  end

  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(name: params[:name], comment: params[:comment], score: params[:score], book_id: params[:book_id])
    review.to_json
  end

  post "/reviews" do
    book = Book.find(params[:book_id])
    review = book.reviews.create(name: params[:name], comment: params[:comment], score: params[:score])
    review.to_json
  end

  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end




end
