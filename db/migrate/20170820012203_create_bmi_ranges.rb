class CreateBmiRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :bmi_ranges do |t|
      t.decimal :lower_limit, precision: 5, scale: 2
      t.decimal :upper_limit, precision: 5, scale: 2
      t.integer :category

      t.timestamps
    end
  end
end
