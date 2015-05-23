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
  if current_user
    @user = current_user
  else
    redirect '/'
  end
   erb :"user/dashboard"
end

get '/users/:id' do
  @user = current_user
  erb :"user/show"
end

get '/users/:id/edit' do
  p "3" * 100
  @user = current_user
  erb :"user/edit"
end

put '/users/:id' do
  p "3" * 100
  @user = current_user
  @user.update(
    first_name:         params[:first_name],
    last_name:          params[:last_name],
    email:              params[:email],
    credit_card_number: params[:credit_card_number]
  )
  if @user.save
    redirect '/users/dashboard'
  else
    status 404
  end
end

get '/rooms/new' do
  erb :"room/new"
end

post '/rooms' do
  Room.create(
    name:         params[:name],
    description:  params[:description],
    country:      params[:country],
    state:        params[:state],
    city:         params[:city],
    street:       params[:street],
    price:        params[:price],
    user_id:      current_user.id,
    availability: true
  )
  redirect to '/'
end

get '/rooms/:id' do
  @room = Room.find(params[:id])
  @user = User.find(@room.user_id)
   erb :"room/show"
end

get '/countries/:name/rooms' do
  @rooms = Room.where(country: params[:name]) #array
  erb :"room/all"
end
