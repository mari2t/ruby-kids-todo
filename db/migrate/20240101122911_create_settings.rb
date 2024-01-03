class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :reward_url1
      t.string :reward_url2
      t.string :reward_url3
      t.string :reward_url4
      t.string :reward_url5
      t.string :reward_url6
      t.string :reward_url7
      t.string :reward_url8
      t.string :reward_url9
      t.string :reward_url10
      t.boolean :show_uncompleted_todos
      t.string :display_background

      t.timestamps
    end
  end
end
