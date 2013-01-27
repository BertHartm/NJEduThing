class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :county
      t.string :district
      t.string :name
      t.integer :county_id
      t.integer :district_id
      t.integer :school_id
      t.string :DFG
      t.integer :numstudents
      t.integer :numpassing
      t.float :avgclasssize

      t.timestamps
    end
  end
end
