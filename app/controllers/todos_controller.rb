# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :find_todo, only: :update

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.create(todo_params)
    render json: @todo, status: :created
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render status: :no_content
  end

  def update
    @todo.update(todo_params)

    render json: @todo
  end

  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :content, :urgent, :done)
  end
end
