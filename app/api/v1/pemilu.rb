module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :lokasi_pilkada do
      desc "Return all lokasi pilkada"
      get do
        locations = Array.new
        valid_params = {
          id: 'id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        search = !params[:nama].blank? ? ['name like ?', params[:nama]] : []
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Location.where(conditions)
          .where(search)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            locations << {
              id: data.id,
              nama: data.name,
              link: data.home_url
            }
          end

        {
          results: {
            count: locations.count,
            total: Location.where(conditions).where(search).count,
            lokasi: locations
          }
        }
      end
    end

    resource :suara_data do
      desc "Return all data suara"
      get do
        suara_data = Array.new
        valid_params = {
          id: 'id',
          lokasi: 'location_id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        SuaraData.where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            suara_data << {
              id: data.id,
              lokasi: {
                id: data.location_id,
                nama: data.location.name
              },
              suara_sah: data.suara_sah,
              suara_tidak_sah: data.suara_tidak_sah,
              total_suara: data.total_suara,
              jumlah_suara_tertulis: data.jumlah_suara_tertulis,
              selisih: data.selisih
            }
          end

        {
          results: {
            count: suara_data.count,
            total: SuaraData.where(conditions).count,
            suara_data: suara_data
          }
        }
      end
    end

    resource :pemilih_data do
      desc "Return all data pemilih"
      get do
        pemilih_data = Array.new
        valid_params = {
          id: 'id',
          lokasi: 'location_id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        PemilihData.where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            pemilih_data << {
              id: data.id,
              lokasi: {
                id: data.location_id,
                nama: data.location.name
              },
              jumlah_pemilih_laki_laki: data.jumlah_pemilih_laki_laki,
              pengguna_hak_pilih_laki_laki: data.pengguna_hak_pilih_laki_laki,
              jumlah_pemilih_perempuan: data.jumlah_pemilih_perempuan,
              pengguna_hak_pilih_perempuan: data.pengguna_hak_pilih_perempuan,
              total_pemilih: data.total_pemilih,
              total_pengguna_hak_pilih: data.total_pengguna_hak_pilih,
              jumlah_pemilih_disabilitas: data.jumlah_pemilih_disabilitas,
              pengguna_hak_pilih_disabilitas: data.pengguna_hak_pilih
            }
          end

        {
          results: {
            count: pemilih_data.count,
            total: PemilihData.where(conditions).count,
            pemilih_data: pemilih_data
          }
        }
      end
    end

    resource :riset_partisipasi do
      desc "Return all data riset partisipasi pilkada 2015"
      get do
        riset_partisipasi = Array.new
        valid_params = {
          id: 'id',
          lokasi: 'location_id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        RisetPartisipasi.where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            riset_partisipasi << {
              id: data.id,
              lokasi: {
                id: data.location_id,
                nama: data.location.name
              },
              jumlah_pemilih_laki_laki: data.pemilih_data.jumlah_pemilih_laki_laki,
              pengguna_hak_pilih_laki_laki: data.pemilih_data.pengguna_hak_pilih_laki_laki,
              jumlah_pemilih_perempuan: data.pemilih_data.jumlah_pemilih_perempuan,
              pengguna_hak_pilih_perempuan: data.pemilih_data.pengguna_hak_pilih_perempuan,
              total_pemilih: data.pemilih_data.total_pemilih,
              total_pengguna_hak_pilih: data.pemilih_data.total_pengguna_hak_pilih,
              jumlah_pemilih_disabilitas: data.pemilih_data.jumlah_pemilih_disabilitas,
              pengguna_hak_pilih_disabilitas: data.pemilih_data.pengguna_hak_pilih,
              suara_sah: data.suara_data.suara_sah,
              suara_tidak_sah: data.suara_data.suara_tidak_sah,
              total_suara: data.suara_data.total_suara,
            }
          end

        {
          results: {
            count: riset_partisipasi.count,
            total: RisetPartisipasi.where(conditions).count,
            riset_partisipasi: riset_partisipasi
          }
        }
      end
    end
  end
end