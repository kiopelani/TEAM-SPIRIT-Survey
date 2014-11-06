get '/surveys' do
  @surveys=Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do

  erb :'/surveys/new'
end


post '/surveys/new' do
  Survey.create(params)
  redirect '/surveys'
end

delete '/surveys/:id' do
  Survey.delete(params[:id])
  redirect '/surveys'
end

get '/surveys/:id' do
  @survey=Survey.find(params[:id])
  erb :'/surveys/show'
end

get 'surveys/:id/edit' do
  @survey=Survey.find(params[:id])
  erb :'/surveys/edit'
end
