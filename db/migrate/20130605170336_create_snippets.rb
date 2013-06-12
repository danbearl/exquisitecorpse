class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :body
      t.references :author
      t.references :corpse
      t.timestamps
    end
  end
end
