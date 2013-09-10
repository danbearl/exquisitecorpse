class AddPropertiesToProfile < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.text :about
    end
  end
end
