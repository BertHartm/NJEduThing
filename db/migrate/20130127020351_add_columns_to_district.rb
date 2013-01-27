class AddColumnsToDistrict < ActiveRecord::Migration
  def change
    add_column :districts, :county_id, :integer
    add_column :districts, :district_id, :integer
    add_column :districts, :county, :string
    add_column :districts, :district, :string
    add_column :districts, :numstudents, :integer
    add_column :districts, :numpassing, :integer
  end
end
