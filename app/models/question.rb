# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer          not null
#
class Question < ApplicationRecord 

    validates :text, :poll_id, presence: true 

    belongs_to :poll

    has_many :answer_choices

    has_many :responses,
    through: :answer_choices,
    source: :responses 


    # def results_n()
    #     choices = answer_choices

    #     results = {}
    #     choices.each do |c|
    #         results[c.text] = c.responses.count
    #     end

    #     results
    # end

    # def results_2x()
    #     choices = answer_choices.includes(:responses)

    #     results = {}
    #     choices.each do |c|
    #         results[c.text] = c.responses.count
    #     end

    #     results

    # end


    def results 
        # choices = Question.select( :answer_choices, "COUNT(")


        choices = self.answer_choices.select("answer_choices.text, COUNT(responses.id) as num_response").left_outer_joins(:responses).group('answer_choices.id')

        results = {}
        choices.each do |c|
            results[c.text] = c.num_response
        end
        results 
    end



end
