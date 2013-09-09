class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profile do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
