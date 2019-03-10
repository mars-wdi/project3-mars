class CreatePlaces < ActiveRecord::Migration[5.2]
    def change
      create_table :places do |t|
        t.string :country
        t.string :city
        t.integer :catogry
        t.boolean :name
        t.string :visit
        t.string :favorite
  
        t.timestamps
      end
    end
  end