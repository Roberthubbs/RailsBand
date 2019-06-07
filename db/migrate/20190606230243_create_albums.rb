class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title 
      t.string :band    
      t.integer :year
      t.boolean :studio, :default => true
      t.timestamps
    end
  end
end
