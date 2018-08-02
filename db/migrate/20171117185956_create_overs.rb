class CreateOvers < ActiveRecord::Migration
  def change
    create_table :overs do |t|
      t.string :name
      t.string :bill
      t.timestamps
    end
  end
end
