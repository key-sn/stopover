class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.text :text
      t.timestamps
    end
  end
end
