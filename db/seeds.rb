require 'faker'

5.times do
  user = User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => "spirit")
  5.times do
    survey = user.surveys.create(title: Faker::Company.name)
    10.times do
      question = survey.questions.create(:content => Faker::Lorem.sentence)
      10.times do
        choice = question.choices.create(:choice_content => Faker::Company.bs)
      end
    end
  end
end


