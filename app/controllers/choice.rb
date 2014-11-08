post '/surveys/:survey_id/questions/:question_id/choices/new' do
  question=Question.find(params[:question_id])
    choice = Choice.create(:choice_content => params[:choice_content])
    question.choices << choice
    "<a href='/surveys/#{params[:survery_id]}/questions/#{question.id}/choices/#{choice.id}'><li>#{choice.choice_content}</li></a>"
end

get '/surveys/:survey_id/questions/:question_id/choices/:choice_id' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  @choice = Choice.find(params[:choice_id])
  erb :'surveys/choice'
end

put '/surveys/:survey_id/questions/:question_id/choices/:choice_id' do
  choice = Choice.find(params[:choice_id])
  choice.update_attributes(params[:choice])
  redirect "/surveys/#{params[:survey_id]}/questions/#{params[:question_id]}/choices/#{params[:choice_id]}"
end

delete '/surveys/:survey_id/questions/:question_id/choices/:choice_id' do
  choice = Choice.find(params[:choice_id])
  choice.delete
  redirect "/surveys/#{params[:survey_id]}/questions/#{params[:question_id]}"
end
