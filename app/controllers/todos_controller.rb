# class TodosController < ApplicationController

#     def get_todos
#        render json:Todo.all
#     end


#     def create
#         title = todo_params[:title]
#         description = todo_params[:description]
#         priority = todo_params[:priority]
#     end


#     # add toso in DB
#     todo = Todo.create(title: title, description: description, priority: priority)
#     render json: todo



#     private
#     def todo_params
#         params.permit(:title, :description, :priority)
#     end
# end

class TodosController < ApplicationController
    def get_todos
        render json: Todo.all
    end
    def create
        title = todo_params[:title]
        description = todo_params[:description]
        priority = todo_params[:priority]
        todo = Todo.create(title: title, description: description, priority: priority)
        render json: todo
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
end