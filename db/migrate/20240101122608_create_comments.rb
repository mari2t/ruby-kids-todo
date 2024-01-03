class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
