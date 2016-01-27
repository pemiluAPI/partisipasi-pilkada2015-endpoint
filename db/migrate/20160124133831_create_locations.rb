class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string  :name
      t.string  :home_url
    end
  end
end
