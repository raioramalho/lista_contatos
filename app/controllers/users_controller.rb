class UsersController < ApplicationController
    before_action :require_logged_in_user, only: [:show, :edit, :update]

    def new
        redirect_to contacts_path if user_signed_in?
        @user = User.new
      end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:sucess] = 'Usuário cadastrado com sucesso.'
            redirect_to root_url
        else
            flash[:sucess] = 'Algo saiu errado, tente novamente.'
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end

end
