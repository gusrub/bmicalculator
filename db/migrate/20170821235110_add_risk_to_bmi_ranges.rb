class AddRiskToBmiRanges < ActiveRecord::Migration[5.1]
  def change
    add_column :bmi_ranges, :risk, :integer
  end
end
