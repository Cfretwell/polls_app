# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord 

    validates :username, presence: true, uniqueness: true 

    has_many :authored_polls,
    foreign_key: :author,
    class_name: 'Poll',
    primary_key: :id

    has_many :responses

    def self.completed_polls_sql

        # self.responses.questions.select("polls.*, COUNT()").joins().group(:poll)

        Poll.find_by_sql( <<-SQL)
            SELECT
                polls.*, COUNT(questions.id) 
            FROM
                questions
            JOIN
                polls ON questions.poll_id = polls.id

            GROUP BY 
                polls.id 
        SQL
        
    end


    # def completed_polls 

    #     Poll.select("polls.title, COUNT(questions.id) as question_count").joins(:questions).joins(:answered , answered: Response.select(:answer_choice_id).where(user_id: self.id )).group("polls.id")
    #     Response.select(:answer_choice_id).where(user_id: self.id )

    # end

end
