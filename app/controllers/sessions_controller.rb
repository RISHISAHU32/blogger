class SessionsController < ApplicationController

    def new
    end

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]= user.id
            # grab info. about user whos logged in 
            flash[:notice]="loged in successfully"
            redirect_to user
        else 
            flash.now[:alert]= "there was something wrong with details"
            render 'new'
        end
        
    end

    def destroy
        session[:user_id] = nil
        flash[:notice]= "logged out"
        redirect_to root_path
    end
end
