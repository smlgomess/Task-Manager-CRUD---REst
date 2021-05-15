
class TaskSerializer < ActiveModel::Serializer
include Rails.application.routes.url_helpers

attributes :id, :titulo, :status, :descricao, :created_at, :updated_at, :links

def links
  [
    {
      rel: :self,
      href: api_v1_task_path(object)
    }
  ]
end

end
 