module ApplicationHelper

    def gravatar_for(user, options= {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username,class:"rounded shadow mx-auto d-block")

    end

    def current_user
        # currant user who's logged in 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]

    # we will return @current user , if we have current user already if not wouldn't hit the DB
    end

    def logged_in?
        !!current_user
    # !!(bang bang) if have user already logged_in? return true otherwise false (boolen value)
    end
end
