# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160124133946) do

  create_table "locations", force: true do |t|
    t.string "name"
    t.string "home_url"
  end

  create_table "pemilih_data", force: true do |t|
    t.integer "location_id"
    t.string  "jumlah_pemilih_laki_laki"
    t.string  "pengguna_hak_pilih_laki_laki"
    t.string  "jumlah_pemilih_perempuan"
    t.string  "pengguna_hak_pilih_perempuan"
    t.string  "total_pemilih"
    t.string  "total_pengguna_hak_pilih"
    t.string  "jumlah_pemilih_disabilitas"
    t.string  "pengguna_hak_pilih"
  end

  add_index "pemilih_data", ["location_id"], name: "index_pemilih_data_on_location_id", using: :btree

  create_table "riset_partisipasis", force: true do |t|
    t.integer "location_id"
    t.integer "suara_data_id"
    t.integer "pemilih_data_id"
  end

  add_index "riset_partisipasis", ["location_id"], name: "index_riset_partisipasis_on_location_id", using: :btree
  add_index "riset_partisipasis", ["pemilih_data_id"], name: "index_riset_partisipasis_on_pemilih_data_id", using: :btree
  add_index "riset_partisipasis", ["suara_data_id"], name: "index_riset_partisipasis_on_suara_data_id", using: :btree

  create_table "suara_data", force: true do |t|
    t.integer "location_id"
    t.string  "suara_sah"
    t.string  "suara_tidak_sah"
    t.string  "total_suara"
    t.string  "jumlah_suara_tertulis"
    t.string  "selisih"
  end

  add_index "suara_data", ["location_id"], name: "index_suara_data_on_location_id", using: :btree

end
