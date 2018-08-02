class AddAToStops < ActiveRecord::Migration
  def change
    remove_column :stops, :money, :integer
    add_column :stops, :money, :text, array: true
  end
end
