class AddScoresToHotsprings < ActiveRecord::Migration[6.1]
  def change
    add_column :hotsprings, :score, :float, default: 2.5
  end
end
