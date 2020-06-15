class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]
    before_action :login_required, only: [:show, :edit]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
        session.clear if session[:user_id]
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :title, :birth_date, :education, :skills)
    end

    def find_user
        @user = User.find_by(:id => session[:user_id])
    end

end