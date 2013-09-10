class CreateFriendsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :friends do |t|
      t.integer :user_id
      t.integer :friend_id
    end
  end
end
