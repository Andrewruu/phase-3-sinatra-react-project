class Book < ActiveRecord::Base
    has_many :reviews
    
    def delete_with_reviews
        reviews.each{ |review| review.delete}
    end

end
