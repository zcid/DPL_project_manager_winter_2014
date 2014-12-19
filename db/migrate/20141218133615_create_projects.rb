class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :team
      t.string :title
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
