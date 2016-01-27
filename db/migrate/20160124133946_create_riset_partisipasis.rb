class CreateRisetPartisipasis < ActiveRecord::Migration
  def change
    create_table :riset_partisipasis do |t|
      t.references  :location
      t.references  :suara_data
      t.references  :pemilih_data
    end
    add_index :riset_partisipasis, :location_id
    add_index :riset_partisipasis, :suara_data_id
    add_index :riset_partisipasis, :pemilih_data_id
  end
end
