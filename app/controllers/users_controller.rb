class UsersController < ApplicationController

    skip_before_action :onlySingnIn, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        user_params = params.require(:user).permit(:name,:email,:password_digest,:password_confirmation)
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:auth] = {id: @user.id}
            redirect_to '/', success: 'compte créer avec succes'
            #render 'new'
        else
            render 'new'
        end
        
    end

    def edit
        @user = User.find(session[:auth]['id'])
    end

    def update
        @user = currentUser
        user_params = params.require(:user).permit(:name, :email, :password_digest, :password_confirmation)
        if @user.update(user_params)
            redirect_to profil_path, success: "modification éffectuée"
        else
            render :edit
        end
    end

    def show
        @user = User.find(session[:auth]['id'])
    end

    def destroy
        @user = User.find(session[:auth]['id'])
        @user.destroy
        redirect_to new_session_path, success: "compte supprimé"
    end

end