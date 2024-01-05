# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
Setting.create(
  reward_url1: "https://github.com/mari2t",
  reward_url2: "https://github.com/mari2t",
  reward_url3: "https://github.com/mari2t",
  reward_url4: "https://github.com/mari2t",
  reward_url5: "https://github.com/mari2t",
  reward_url6: "https://github.com/mari2t",
  reward_url7: "https://github.com/mari2t",
  reward_url8: "https://github.com/mari2t",
  reward_url9: "https://github.com/mari2t",
  reward_url10: "https://github.com/mari2t",
  show_uncompleted_todos: true,
  display_background: "初期背景"
)
