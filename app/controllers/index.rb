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

get '/users/:id' do

end

put '/users/:id' do

end

get '/users/dashboard' do

end

get '/rooms/:id' do

end

get '/cities/:name/rooms' do

end

get 'rooms/new' do

end

post '/rooms' do

end

