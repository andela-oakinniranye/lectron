# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

interest_categories = [
  {
    title: "Games",
    description: "Call of Duty, Hitman, Grand Theft Auto and all the games you may ever want, there are people with similar interests here"
  },
  {
    title: "Movies",
    description: "Wish you had a friend to discuss that scene in the Avengers? Don't worry, we've got you covered"
  },
  {
    title: "Technology",
    description: "All things tech + the latest Apple and Google events, you can find people who love to share with you"
  }
]

interest_categories.each_with_index{ |interest, index|
  interest_categories[index] = InterestCategory.create!(interest)
}
# binding.pry
