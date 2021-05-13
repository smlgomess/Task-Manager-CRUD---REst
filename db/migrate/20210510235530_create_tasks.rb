class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :titulo
      t.string :status
      t.text :descricao

      t.timestamps
    end
  end
end
