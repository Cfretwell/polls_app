# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Poll.destroy_all
Response.destroy_all


u1 = User.create!(username: 'Ted')
u2 = User.create!(username: 'George')
u3 = User.create!(username: 'Theodore')



p1 = Poll.create!(title: 'How do I do Polls?', author: u1)

q1 = Question.create!(text: 'How do I start?', poll: p1)
ac1 = AnswerChoice.create!(text: "Start here", question: q1)
ac2 = AnswerChoice.create!(text: "Start there", question: q1)
r1 = Response.create!(respondent: u2, answer_choice: ac1 )

q2 = Question.create!(text: 'How do I run the middle?', poll: p1)
ac3 = AnswerChoice.create!(text: "Run over there", question: q2)
ac4 = AnswerChoice.create!(text: "Run over here", question: q2)

q3 = Question.create!(text: 'How do I finnish?', poll: p1)
ac5 = AnswerChoice.create!(text: "Finnish over there", question: q3)
ac6 = AnswerChoice.create!(text: "Finnish over here", question: q3)


p2 = Poll.create!(title: 'State Ranch questionare', author: u2)

q4 = Question.create!(text: 'On a scale of 1-2 how did we do?', poll: p2)
ac7 = AnswerChoice.create!(text: "1", question: q4)
ac8 = AnswerChoice.create!(text: "2", question: q4)

q5 = Question.create!(text: 'Where are you located?', poll: p2)
ac9 = AnswerChoice.create!(text: "Here", question: q5)
ac10 = AnswerChoice.create!(text: "There", question: q5)



p3 = Poll.create!(title: 'Are you comfortable in your office?', author: u1)

q6 = Question.create!(text: 'How warm is it?', poll: p3)
ac11 = AnswerChoice.create!(text: "Cold", question: q6)
ac12 = AnswerChoice.create!(text: "Hot", question: q6)

q7 = Question.create!(text: 'Why is it always so warm?', poll: p3)
ac13 = AnswerChoice.create!(text: "Ellie", question: q7)
ac14 = AnswerChoice.create!(text: "Ryan", question: q7)



r2 = Response.create!(respondent: u2, answer_choice: ac14 )
