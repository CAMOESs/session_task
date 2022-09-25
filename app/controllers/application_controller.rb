class ApplicationController < ActionController::Base
    add_flash_types :success, :danger
    before_action :onlySingnIn
    helper_method :currentUser, :userSingnIn

    private

    def onlySingnIn
        if !userSingnIn
            redirect_to new_user_path, danger: "pas le droit"
        end 
    end

    def currentUser
        return nil if !session[:auth] || !session[:auth]['id']
        return @_user if @_user
        @_user = User.find_by_id(session[:auth]['id'])
    end

    def userSingnIn
        !currentUser.nil?
    end

end
