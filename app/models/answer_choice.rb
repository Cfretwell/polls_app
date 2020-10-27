# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#
class AnswerChoice < ApplicationRecord 

    validates :text, :question_id, presence: true 

    belongs_to :question

    has_many :responses



end
