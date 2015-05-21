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

# homepage
get '/' do
  erb :index
end

# open user page
get '/users/:id' do

end

# update user page
put '/users' do

end

# open user page
get '/users/dashboard' do

end

# room page
get '/rooms/:id' do

end

# rooms list under city
get '/cities/:name/rooms' do

end

# new room form
get 'rooms/new' do

end

# post new room
post '/rooms' do

end
