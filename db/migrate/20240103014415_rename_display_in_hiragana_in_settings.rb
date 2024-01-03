class RenameDisplayInHiraganaInSettings < ActiveRecord::Migration[7.1]
  def change
    rename_column :settings, :display_in_hiragana, :display_background
    change_column :settings, :display_background, :string
  end
end

