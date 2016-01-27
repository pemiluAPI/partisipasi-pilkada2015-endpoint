class SuaraData < ActiveRecord::Base
  belongs_to  :location
  has_one :riset_partisipasi
end
