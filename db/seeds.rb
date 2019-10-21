# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Grade.destroy_all
UserGrade.destroy_all
Subject.destroy_all
Lesson.destroy_all

User.create(username: "eklimowich", password: "password", bio: "About me.", avatar: "mypic.com")
User.create(username: "User1", password: "password1", bio: "About User1.", avatar: "user1pic.com")
User.create(username: "User2", password: "password2", bio: "About User2.", avatar: "user2pic.com")

Subject.create(subject_name: "ELA")
Subject.create(subject_name: "Math")
Subject.create(subject_name: "Science")

Grade.create(grade_name: "K")
Grade.create(grade_name: "1st")
Grade.create(grade_name: "2nd")
Grade.create(grade_name: "3rd")
Grade.create(grade_name: "4th")

UserGrade.create(user_id: 1, grade_id: 1)
UserGrade.create(user_id: 1, grade_id: 2)
