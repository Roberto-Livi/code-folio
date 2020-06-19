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
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.profile_pic = auth['info']['image']
        end

        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end