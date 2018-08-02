class AddmoneyToStops < ActiveRecord::Migration
  def change
    add_column :stops, :money, :text
    remove_column :stops, :train0, :integer
    remove_column :stops, :train1, :integer
    remove_column :stops, :train2, :integer
  end
end
