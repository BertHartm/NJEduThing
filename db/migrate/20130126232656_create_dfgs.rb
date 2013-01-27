class CreateDfgs < ActiveRecord::Migration
  def change
    create_table :dfgs do |t|
      t.string :label
      t.float :passrate

      t.timestamps
    end
  end
end
