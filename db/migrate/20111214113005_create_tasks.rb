class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :user
      t.references :project

      t.timestamps
    end
  end
end
