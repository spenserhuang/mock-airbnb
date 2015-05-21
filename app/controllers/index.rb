# homepage
  # cities list
  # post new room
  # get
  # post
# open user page
  # user's name
  # list of rooms under that user
  # get
# self user page
  # for updating user info
  # get
  # put
# room page
  # for displaying room info
  # *** reserving the room
  # get
# room list
  # list of all the rooms in that city
  # get
  # post
# new room form
  # form for creating a new room
  # get
  # post

get '/' do
  erb :index
end

get '/users/dashboard' do
  # p "*" * 90
  # user_id = session[:user_id]
  # p user_id
  # @user = User.find(user_id)
  if current_user
    @user = current_user
  else
    redirect '/'
  end
   erb :"user/dashboard"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"user/show"
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.update_attribute(
     first_name: params[:first_name],
     last_name: params[:last_name],
     username: params[:username],
     password_digest: params[:password_digest],
     email: params[:email],
     credit_card_number: params[:credit_card_number]
    )
end



get '/rooms/new' do
  erb :"room/new"
end

get '/rooms/:id' do
  @room = Room.find(params[:id])
   erb :"room/show"
end

get '/countries/:name/rooms' do
  @rooms = Room.where(country: params[:name]) #array
  erb :"room/all"
end



post '/rooms' do
  Room.create(
     name: params[:name],
     description: params[:description],
     country: params[:country],
     state: params[:state],
     city: params[:city],
     street: params[:street],
     price: params[:price],
     availability: true
  )
  p "1" * 100
  redirect to '/'
end