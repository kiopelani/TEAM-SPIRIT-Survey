class ChoiceUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  belongs_to :survey
  belongs_to :question
end
