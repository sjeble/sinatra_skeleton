helpers do
  def current_user
    if !!session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def ensure_login
    if logged_in?
      true
    else
      halt(404, "<h1>No Way Jose</h1>" )
    end
  end
end
