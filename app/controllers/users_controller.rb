class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :index]
    before_action :login_required, only: [:show, :edit, :index]

    def index
    end

    def new
        if current_user
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
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
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        session.clear if session[:user_id]
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation,:title, :birth_date, :education, :skills)
    end

    def find_user
        @user = User.find(params[:id])
    end

end