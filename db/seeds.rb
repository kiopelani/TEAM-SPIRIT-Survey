require 'faker'

5.times do
  Survey.create(title: Faker::Company.name)
end

30.times do
  Question.create(:survey_id => rand(1..5), :content => Faker::Lorem.sentence)
end

100.times do
  Choice.create(:question_id => rand(1..30), :choice_content => Faker::Company.bs)
end

