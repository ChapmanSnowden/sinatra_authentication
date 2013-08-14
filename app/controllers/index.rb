get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 @users = User.all
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  redirect '/' if logged_in?
  erb :sign_in
end

post '/sessions' do
  if user = User.verify(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  redirect '/' if logged_in?
  @user = User.new
  erb :sign_up
end

post '/users' do
  @user = User.new(params[:user])
    if @user.save
      redirect '/'
    else
      erb :sign_up
  end
end

