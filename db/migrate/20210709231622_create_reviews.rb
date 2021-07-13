class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :hotspring, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at]
  end
end
