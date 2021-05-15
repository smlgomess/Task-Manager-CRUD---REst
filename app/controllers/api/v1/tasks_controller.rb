module Api
    module V1     
        class TasksController < ApplicationController

            def index 
                @tasks = Task.order('created_at DESC')
                render json: @tasks, each_serializer: TaskSerializer, status: :ok
                
            end

            def show 
                @task = Task.find(params[:id])
                render json: @task, serializer: TaskSerializer, status: :ok
            end

            def create 
                @task = Task.new(tasks_params)
                if @task.save
                    render json: @task, serializer: TaskSerializer, status: :created
                    
                else
                    render json: {status: 'ERROR', message: 'tarefa não foi criada',
                        data:@task.errors}, status: :unprocessable_entity
                    
                end
            end

            def destroy
                @task = Task.find(params[:id])
                if @task.destroy
                    render json: @task, serializer: TaskSerializer, status: :ok
                else
                    render json: {status: 'ERROR', message: 'não foi possível apagar a tarefa',
                        data:@task.errors}, status: :unprocessable_entity
                end
            end

            def update 
                @task = Task.find(params[:id])
                if @task.update(tasks_params)
                    render json: @task, serializer: TaskSerializer, status: :ok                   
                else
                    render json: {status: 'ERROR', message: 'tarefa não foi atualizada',
                        data:@task.errors}, status: :unprocessable_entity
                    
                end
            end

            private

            def tasks_params
                params.permit(:titulo, :status, :descricao)
            end

        end
    end
end