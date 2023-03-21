class UsersController < ApplicationController

def create
    user = User.create(user_params)
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

#Todo delete and show individual user

private
def user_params
    params.permit(:email, :password)
end

end
