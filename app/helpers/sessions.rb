helpers do

  def logged_in?
    return true if session[:user_id]
  end
  
  def current_user
    # TODO: return the current user if there is a user signed in.
    if logged_in?
      return User.find(session[:user_id])
    end
  end

end
