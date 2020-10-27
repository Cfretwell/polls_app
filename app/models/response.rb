# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  answer_choice_id :integer          not null
#  user_id          :integer          not null
#
class Response < ApplicationRecord 

    validates :answer_choice_id, :user_id, presence: true 
    validate :respondent_already_answered?
    validate :author_response

    belongs_to :answer_choice
    # primary_key: :id,
    # foreign_key: :answer_choice_id,
    # class_name: 'AnswerChoice'

    belongs_to :respondent, 
    foreign_key: :user_id,
    class_name: 'User'

    has_one :question,
    through: :answer_choice,
    source: :question

    def author_response
        if self.question.poll.author.id == self.user_id
            errors[:author] << "not allowed to respond"
        end
    end


    def respondent_already_answered?
        if sibling_responses().where(user_id: self.user_id).exists?
            errors[:question] << "has already been answered"
        end
    end


    def sibling_responses()
        self.question.responses.where.not(id: self.id) 
    end


end
