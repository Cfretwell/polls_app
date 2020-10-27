# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
class Poll < ApplicationRecord 

    validates :title, :author_id, presence: true 

    belongs_to :author,
    class_name: 'User'


    has_many :questions
    

    



end
