class AddNumberFromCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :number, :integer
  end
end
