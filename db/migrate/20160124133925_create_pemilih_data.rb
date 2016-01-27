class CreatePemilihData < ActiveRecord::Migration
  def change
    create_table :pemilih_data do |t|
      t.references  :location
      t.string  :jumlah_pemilih_laki_laki
      t.string  :pengguna_hak_pilih_laki_laki
      t.string  :jumlah_pemilih_perempuan
      t.string  :pengguna_hak_pilih_perempuan
      t.string  :total_pemilih
      t.string  :total_pengguna_hak_pilih
      t.string  :jumlah_pemilih_disabilitas
      t.string  :pengguna_hak_pilih
    end

    add_index :pemilih_data, :location_id
  end
end
