

class TodosController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def get_todos
        email = session[:email]
        if email

        render json: Todo.all
        else
            render json: {message: "Not Authorized"}, status: :unauthorized
    end

end
   
   
    def create

        # title = todo_params[:title]
        # description = todo_params[:description]
        # priority = todo_params[:priority]
        
        user = cookies[:email]
        if user
                            
                todo = Todo.create(todo_params)
                render json: todo
       
        else
            render json: {message: "YOU ARE NOT LOGGED IN"},
            status: 401
        end
        
        
    end

    def update
        id = params[:id]
        todo = Todo.find(id.to_i)
        todo.update(todo_params)
        render json: {message: "Update successfully"}
    end

    def delete
        id = params[:id]
        todo = Tod.find(id)
        todo.destroy
        render json: {message: "Deleted successfully"}
    end

    private
    def todo_params
        params.permit(:title, :description, :priority)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end

