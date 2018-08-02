class AddBToStops < ActiveRecord::Migration
  def change
    remove_column :stops, :money, :text, array: true
    add_column :stops, :money, :text
  end
end
