# Register
get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    erb :"users/new"
  end
end

# User profile
get '/users/:user_id' do
  if logged_in?
    @user = User.find_by(id: params[:user_id])
    erb :"users/show"
  else
    redirect '/'
  end
end

# Login
get '/login' do

  erb :"users/login"
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    login(@user)
    redirect '/users/#{@user.id}'
  else
    erb :"users/login"
  end
end

# Logout
get '/logout' do
  logout
  redirect '/'
end
