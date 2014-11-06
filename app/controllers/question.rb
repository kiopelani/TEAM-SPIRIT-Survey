get '/surveys/:survey_id/questions/:question_id' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  erb :'surveys/question'
end

post '/surveys/:id/questions/new' do
    survey=Survey.find(params[:id])
    survey.questions << Question.create(:content => params[:content])
    redirect "/surveys/#{params[:id]}"
end

delete '/surveys/:survey_id/questions/:question_id' do
  question = Question.find(params[:question_id])
  question.delete
  redirect "/surveys/#{params[:survey_id]}"
end

get '/surveys/:survey_id/questions/:question_id/edit' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  erb :'surveys/edit_question'
end

put '/surveys/:survey_id/questions/:question_id' do
  question = Question.find(params[:question_id])
  question.update_attributes(params[:question])
  redirect "/surveys/#{params[:survey_id]}/questions/#{params[:question_id]}"
end


