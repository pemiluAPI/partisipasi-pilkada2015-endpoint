class RisetPartisipasi < ActiveRecord::Base
  belongs_to  :riset_partisipasi
  belongs_to  :suara_data
  belongs_to  :pemilih_data
  belongs_to  :location
end
