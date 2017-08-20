class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.references :user, foreign_key: true
      t.references :bmi_range, foreign_key: true

      t.timestamps
    end
  end
end
