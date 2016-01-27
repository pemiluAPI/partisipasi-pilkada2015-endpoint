class Location < ActiveRecord::Base
  has_one :pemilih_data
  has_one :suara_data
  has_one :riset_partisipasi
end
