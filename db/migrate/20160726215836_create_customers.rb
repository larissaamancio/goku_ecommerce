class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :zip_code
      t.string :street
      t.string :state
      t.string :city
      t.string :neighborhood

      t.timestamps
    end
  end
end