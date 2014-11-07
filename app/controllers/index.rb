get '/' do
  redirect '/surveys'
end

get '/surveys' do
  @surveys=Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys/new' do
  @survey = Survey.create(params)
  @survey.user_id = session[:user_id]
  @survey.save
  redirect '/surveys'
end




delete '/surveys/:id' do
  Survey.delete(params[:id])
  redirect '/surveys'
end

get '/surveys/:id/edit' do
  @survey=Survey.find(params[:id])
  erb :'/surveys/edit'
end

get '/surveys/:id' do
  @survey=Survey.find(params[:id])
  erb :'/surveys/show'
end


put '/surveys/:id' do
  survey=Survey.find(params[:id])
  survey.update_attributes(params[:survey])
  redirect "/surveys/#{params[:id]}"
end

get '/surveys/:id/form' do
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  @author = @survey.user
  erb :'surveys/survey_form'
end

post '/surveys/:id/form/submit' do
  results = []
  params[:results].each do |question, choice|
    ChoiceUser.create(:user_id => session[:user_id], :choice_id => choice, :survey_id => params[:id], :question_id => question)
  end
  redirect to '/'
  end


get '/surveys/:id/results' do
  @survey = Survey.find(params[:id])
  @choice_users = ChoiceUser.where(:survey_id => params[:id])
  @questions = []
  @choice_users.each do |choice|
    @questions << choice.question
  end
  @questions.uniq!

  erb :'surveys/survey_results'
end










