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
  p @user
  erb :"user/show"
end

get '/users/dashboard/edit' do
  @user = current_user
  erb :"user/edit"
end

put '/users/dashboard' do
  @user = current_user
  @user.update_attributes(
    first_name:         params[:user][:first_name],
    last_name:          params[:user][:last_name],
    email:              params[:user][:email],
    credit_card_number: params[:user][:credit_card_number],
    username:           params[:user][:username],
    password_digest:    params[:user][:password_digest]
  )
  puts "updated"
  redirect '/users/dashboard'
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
