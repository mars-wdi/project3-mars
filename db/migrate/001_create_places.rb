class CreatePlaces < ActiveRecord::Migration[5.2]
    def change
      create_table :places do |t|
        t.string :country
        t.string :city
        t.string :catogry
        t.string :name
        t.boolean :visit
        t.boolean :favorite
  
        t.timestamps
      end
    end
  end