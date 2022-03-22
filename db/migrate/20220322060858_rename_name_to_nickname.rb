class RenameNameToNickname < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :nickname
  end
end
