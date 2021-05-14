module Api
    module V1     
        class TasksController < ApplicationController

            def index 
                @tasks = Task.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'tarefas carregadas', data:@tasks },
                status: :ok
            end

            def show 
                @tasks = Task.find(params[:id])
                render json: {status: 'SUCCESS', message: 'tarefa carregada', data:@tasks },
                status: :ok
            end

            def create 
                @tasks = Task.new(tasks_params)
                if @tasks.save
                    render json: {status: 'SUCCESS', message: 'tarefa criada', data:@tasks },
                    status: :ok
                    
                else
                    render json: {status: 'ERROR', message: 'tarefa não foi criada',
                        data:@tasks.errors}, status: :unprocessable_entity
                    
                end
            end

            def destroy
                @tasks = Task.find(params[:id])
                @tasks.destroy
                render json: {status: 'SUCCESS', message: 'tarefa apagada', data:@tasks },
                status: :ok
                
            end

            def update 
                @tasks = Task.find(params[:id])
                if @tasks.update(tasks_params)
                    render json: {status: 'SUCCESS', message: 'tarefa atualizada', data:@tasks },
                    status: :ok
                   
                else
                    render json: {status: 'ERROR', message: 'tarefa não foi atualizada',
                        data:@tasks.errors}, status: :unprocessable_entity
                    
                end
            end

            private

            def tasks_params
                params.permit(:titulo, :status, :descricao)
            end

        end
    end
end