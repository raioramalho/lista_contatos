class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    include SessionsHelper #incluindo sessions helpe

    private #Não deixa o usuario visualizar sem estar logado.
        def require_logged_in_user
            flash[:danger] = 'Área restrita. Por favor, realize o login'
            redirect_to entrar_path
        end

end
