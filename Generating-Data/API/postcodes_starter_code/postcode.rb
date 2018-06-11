require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  attr_accessor :single_postcode_result, :multi_postcode_result

  def get_single_postcode(postcode)
    @single_postcode_result = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_status
    @single_postcode_result["status"]
  end

  def get_result
    @single_postcode_result["result"]
  end

  def get_postcode_length
    @single_postcode_result["result"]["postcode"].length
  end

  def get_quality_value
    @single_postcode_result["result"]["quality"]
  end

  def get_ordnance
    @single_postcode_result["result"]["eastings"]
  end

  def get_country
    @single_postcode_result["result"]["country"]
  end

  def get_NHS_Authority
    @single_postcode_result["result"]["nhs_ha"]
  end

  def get_longitude
    @single_postcode_result["result"]["longitude"]
  end

  def get_latitude
    @single_postcode_result["result"]["latitude"]
  end

  def get_constituency
    @single_postcode_result["result"]["parliamentary_constituency"]
  end

  def get_latitude
    @single_postcode_result["result"]["latitude"]
  end

  def get_electoral_region
    @single_postcode_result["result"]["european_electoral_region"]
  end

  def get_constituency
    @single_postcode_result["result"]["parliamentary_constituency"]
  end

  def get_electoral_region
    @single_postcode_result["result"]["european_electoral_region"]
  end

  def get_primary_trust
    @single_postcode_result["result"]["primary_care_trust"]
  end

  def get_region
    @single_postcode_result["result"]["region"]
  end

  def get_parish
    @single_postcode_result["result"]["parish"]
  end

  def get_lsoa
    @single_postcode_result["result"]["lsoa"]
  end

  def get_msoa
    @single_postcode_result["result"]["msoa"]
  end

  def get_admin_district
    @single_postcode_result["result"]["admin_district"]
  end

  def get_incode_string
    @single_postcode_result["result"]["incode"]
  end


  def get_multiple_postcodes(postcodes_array)
      @multi_postcode_result = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_multi_status
    @multi_postcode_result["status"]
  end

  def get_multi_query num
    @multi_postcode_result["result"][num]["query"]
  end

  def get_multi_result num
    @multi_postcode_result["result"][num]["result"]
  end

  def get_multi_postcode_length num
    @multi_postcode_result["result"][num]["result"]["postcode"].length
  end

  def get_multi_quality_value num
    @multi_postcode_result["result"][num]["result"]["quality"]
  end

  def get_multi_ordnance num
    @multi_postcode_result["result"][num]["result"]["eastings"]
  end

  def get_multi_country num
    @multi_postcode_result["result"][num]["result"]["country"]
  end

  def get_multi_NHS_Authority num
    @multi_postcode_result["result"][num]["result"]["nhs_ha"]
  end

  def get_multi_longitude num
    @multi_postcode_result["result"][num]["result"]["longitude"]
  end

  def get_multi_latitude num
    @multi_postcode_result["result"][num]["result"]["latitude"]
  end

  def get_multi_constituency num
    @multi_postcode_result["result"][num]["result"]["parliamentary_constituency"]
  end

  def get_multi_latitude num
    @multi_postcode_result["result"][num]["result"]["latitude"]
  end

  def get_multi_electoral_region num
    @multi_postcode_result["result"][num]["result"]["european_electoral_region"]
  end

  def get_multi_constituency num
    @multi_postcode_result["result"][num]["result"]["parliamentary_constituency"]
  end

  def get_multi_electoral_region num
    @multi_postcode_result["result"][num]["result"]["european_electoral_region"]
  end

  def get_multi_primary_trust num
    @multi_postcode_result["result"][num]["result"]["primary_care_trust"]
  end

  def get_multi_region num
    @multi_postcode_result["result"][num]["result"]["region"]
  end

  def get_multi_parish num
    @multi_postcode_result["result"][num]["result"]["parish"]
  end

  def get_multi_lsoa num
    @multi_postcode_result["result"][num]["result"]["lsoa"]
  end

  def get_multi_msoa num
    @multi_postcode_result["result"][num]["result"]["msoa"]
  end

  def get_multi_admin_district num
    @multi_postcode_result["result"][num]["result"]["admin_district"]
  end

  def get_multi_incode_string num
    @multi_postcode_result["result"][num]["result"]["incode"]
  end

end
