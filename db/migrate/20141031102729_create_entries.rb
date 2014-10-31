class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.boolean :published
      t.timestamps
    end
  end
end
