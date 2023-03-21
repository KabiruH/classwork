class UsersController < ApplicationController

def create
    user = User.create(user_params)
    cookies[:email] = user.email
    render json: {date: user, message: "user created successfully"}
end

def update
    id = params[:id]
    user = User.find(id)
    user.update(user_params)
    render json: {message: "user updated successfully"}
end

def index
    render json: {data: User.all}
end

def login

        email = params[:email]
        user = User.find_by(email: email)

    if user&.authenticate(params[:password])
        render json: {message: "authenticated"}
    else
        render json: {message: "wrong combination of email and password"}
    end



            # if user

            #     authenticated = user.authenticate(params[:password])

            #     render json: {message: authenticated ? 'authenticated' : 'wrong combination'}, status: authenticated ? :ok : :unauthorized
            #     # authenticated = user.authenticate(params[:password])
            #     # authenticated ? render json: {message: "you are logged in successfully"} : 
            #     # render json: {message: "you are not logged in password is incorrect"}, status: :unauthorized

            #     #boolean condition ? (if true) action happens : (if not) alternate action happens
            #     #    if boolean_condition
            #     #     action
            #     #    else
            #     #     alternate_action 

            # else
            #     render json: {message: "user does not exist"}, status: :unprocessable_entity
            # end
        # session[:email] = email =. todo: lift session after user is authenticated
       
    end

def logout

        email = params[:email]
        session[:email] = email
        render json: {message: "you are logged out"}
end

#Todo delete and show individual user
#Todo add logout functionality

private
def user_params
    params.permit(:email, :password)
end

end
