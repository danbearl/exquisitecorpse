class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :message
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
