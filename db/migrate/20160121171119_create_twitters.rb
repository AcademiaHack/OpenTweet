class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :username, null: false
      t.string :biography, null: false

      t.timestamps null: false
    end

    add_index :twitters, :username, unique: true
  end
end
