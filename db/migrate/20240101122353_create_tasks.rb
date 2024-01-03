class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :deadline
      t.boolean :completed, default: false
      t.date :completion_date

      t.timestamps
    end
  end
end
