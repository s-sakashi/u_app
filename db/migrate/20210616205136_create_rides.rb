class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.integer :ride_area, null: false, default: 0
    end
  end
end
