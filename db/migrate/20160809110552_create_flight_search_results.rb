class CreateFlightSearchResults < ActiveRecord::Migration
  def change
    create_table :flight_search_results do |t|
      t.integer :flight_search_id
      t.string :price
      t.date :out_departure_time
      t.date :ot_arrival_time
      t.string :agent
      t.string :airline_company

      t.timestamps null: false
    end
  end
end
