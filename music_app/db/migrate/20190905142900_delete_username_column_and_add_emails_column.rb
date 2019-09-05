class DeleteUsernameColumnAndAddEmailsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username 
    add_column :users, :email, :string 
    add_index :users, :email, unique: true 
  end
end
