class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.float :costperstudent

      t.timestamps
    end
  end
end
