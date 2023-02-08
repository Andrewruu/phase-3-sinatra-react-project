require "faker"
puts "🌱 Seeding spices..."
rand(5..10).times do
    Book.create(
        title: Faker::Book.title,
        image: Faker::LoremFlickr.image,
        summary: Faker::Lorem.sentence,
        author: Faker::Book.author
    )
end
rand(10..20).times do
    Review.create(
        name: Faker::Name.name,
        score: rand(1..10),
        comment: Faker::Lorem.sentence,
        book_id: rand(1..5)
)
end 
puts "✅ Done seeding!"
