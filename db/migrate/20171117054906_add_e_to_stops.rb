class AddEToStops < ActiveRecord::Migration
  def change
    add_column :stops, :bill, :string
  end
end
