class AddCorpseIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :corpse_id, :integer
  end
end
