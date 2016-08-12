class CreateFlightSearches < ActiveRecord::Migration
  def change
    create_table :flight_searches do |t|
      t.string :source
      t.date :outdate
      t.string :from_location
      t.string :to_location
      t.string :result_url
      t.string :taken

      t.timestamps null: false
    end
  end
end
