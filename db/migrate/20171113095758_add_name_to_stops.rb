class AddNameToStops < ActiveRecord::Migration
  def change
      add_column :stops, :name, :string
      add_column :stops, :train0, :integer
      add_column :stops, :train1, :integer
      add_column :stops, :train2, :integer
      remove_column :stops, :text, :text
  end
end
