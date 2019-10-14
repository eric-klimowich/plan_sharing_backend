# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "eklimowich", password: "password", bio: "About me.", avatar: "mypic.com")

Subject.create(name: "ELA", user_id: 1)
Subject.create(name: "Math", user_id: 1)
Subject.create(name: "Science", user_id: 1)
