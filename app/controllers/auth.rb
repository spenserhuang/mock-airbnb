get '/signin' do
  erb :'authorization/signin'
end

post '/signin' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    "Invalid username or password. Please try again!"
    redirect '/signin'
  end
end

get '/signup' do
  erb :'authorization/signup'
end

post '/signup' do
  # user = User.create(params[:user])
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    "Save error. Please sign up again!"
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end