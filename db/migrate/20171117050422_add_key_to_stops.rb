class AddKeyToStops < ActiveRecord::Migration
  def change
    remove_column :stops, :money, :text
    add_column :stops, :money, :integer
  end
end
