class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.timestamps null: false
    end

    add_reference :follows, :twitter
    add_reference :follows, :followed

    add_foreign_key :follows, :twitters, column: :twitter_id
    add_foreign_key :follows, :twitters, column: :followed_id
  end
end
