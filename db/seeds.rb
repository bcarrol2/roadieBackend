# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

review1 = Review.create(rating: 5, name: 'beth', title: 'Love it!', review_text: 'Greatest product and from a wonderful company. Am sure to buy from again!', date: Time.new)
review2 = Review.create(rating: 5, name: 'john', title: 'Best ever!', review_text: 'I will stay with roadie forever', date: Time.new)
review3 = Review.create(rating: 1, name: 'mary', title: 'I want my money back', review_text: 'Id rather not use anything', date: Time.new)
review4 = Review.create(rating: 3, name: 'tim', title: 'It was ok', review_text: 'Hit or miss sometimes', date: Time.new)