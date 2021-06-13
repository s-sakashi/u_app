class CreateHotsprings < ActiveRecord::Migration[6.1]
  def change
    create_table :hotsprings do |t|
      t.string :name
      t.string :address
      t.float :ph
      t.string :quality

      t.timestamps
    end
  end
end
