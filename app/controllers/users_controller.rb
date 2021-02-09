class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        if @user
            render json: {user: @user}
        else
            render json: {
                status: 500,
                errors: ['user not found']
            }
        end
    end
      
    def create 
        @user = User.create(user_params)
        if @user.save
            # Generate authentication token with Knock gem
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {email: @user.email, jwt: auth_token.token}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end 
    end 

    def sign_in 
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            # Generate authentication token with Knock gem
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {email: @user.email, jwt: auth_token.token}, status: 200
        else
            render json: {error: "Incorrect Email or Password"}, status: 404 

        end 
    end 

    private
      
    def user_params
        params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
    end
end