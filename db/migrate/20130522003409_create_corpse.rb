class CreateCorpse < ActiveRecord::Migration
  def change
    create_table :corpses do |t|
      t.timestamps
    end
  end
end
