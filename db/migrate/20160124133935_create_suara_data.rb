class CreateSuaraData < ActiveRecord::Migration
  def change
    create_table :suara_data do |t|
      t.references  :location
      t.string  :suara_sah
      t.string  :suara_tidak_sah
      t.string  :total_suara
      t.string  :jumlah_suara_tertulis
      t.string  :selisih
    end
    add_index :suara_data, :location_id
  end
end
