class AddDToStops < ActiveRecord::Migration
  def change
    remove_column :stops, :money, :string
  end
end
