class RemoveEmojiFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :emoji, :string
  end
end
