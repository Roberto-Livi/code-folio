class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :login_required, :comments_username, :comments_user_instance, :space

    def current_user
        user = User.find_by(:id => session[:user_id])
    end

    def login_required
        unless session[:user_id]
            redirect_to root_url
        end
    end

    def comments_username(user)
        comment = User.find(user).username
    end

    def comments_user_instance(user_id)
        user = User.find(user_id)
    end

    def space
        " "
    end

end
