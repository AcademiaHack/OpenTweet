class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.string :text
      t.references :twitter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
