class AddCToStops < ActiveRecord::Migration
  def change
    remove_column :stops, :money, :text
    add_column :stops, :money, :string
  end
end
