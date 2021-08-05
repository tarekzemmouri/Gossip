class SessionsController < ApplicationController
    before_action :authenticate_user, only: [:index]
    def create  
        user = User.find_by(email: params[:email])

        if user && user.authenticate(password: params[:password])
            log_in(user)
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render 'new'
    end

    def destroy
        session.delete(:user_id)
    end
end
