class CreateMemesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :memes do |t|
      t.string :name, null: false
      t.string :text_top, null: false
      t.string :text_bottom, null: false
      t.integer :status, default: 0, null: false
    end
  end
end
