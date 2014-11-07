get '/login' do
  erb :sign_in
end

post '/login' do
  @user = User.find_by_email(params[:email])
  session[:user_id] = @user.id
  redirect '/'
end

get '/users/new' do
  erb :sign_up
end

post '/users/new' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
