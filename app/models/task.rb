class Task < ApplicationRecord
    validates_presence_of :titulo, :descricao, :status
end
