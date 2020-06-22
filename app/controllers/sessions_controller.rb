class SessionsController < ApplicationController

    def new
        if current_user
            redirect_to user_path(current_user)
        end
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect_to user_path(user)
        else
            redirect_to new_session_path
        end
    end

    def facebook_create
        if User.find_by(uid: auth['uid'])
            @user = User.find_by(uid: auth['uid'])
        else
            @user = User.create(:username => auth['info']['name'], :password => SecureRandom.hex, :uid => auth['uid'])
            flash[:password_notice] = "Your password is: #{@user.password}"
        end

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end

