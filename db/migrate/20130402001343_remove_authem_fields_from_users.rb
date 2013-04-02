class RemoveAuthemFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :salt
    remove_column :users, :crypted_password
  end
end
