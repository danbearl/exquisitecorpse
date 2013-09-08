class AddClosedToCorpse < ActiveRecord::Migration
  def change
    add_column :corpses, :closed, :boolean
  end
end
