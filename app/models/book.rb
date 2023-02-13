class Book < ActiveRecord::Base
    has_many :reviews
    
    def delete_with_reviews
        self.reviews.each{ |review| review.delete}
    end

end
