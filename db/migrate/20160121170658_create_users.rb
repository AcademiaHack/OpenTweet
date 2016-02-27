class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.references :userable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end