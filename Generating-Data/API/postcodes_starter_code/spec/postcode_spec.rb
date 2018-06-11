require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode('B601JA') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_status).to eq 200
    end

    it "should have a results hash" do
      expect(@postcodesio.get_result).to be_kind_of Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_postcode_length).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_quality_value).to be_between(1,9).inclusive
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_ordnance).to be_kind_of Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_country).to include("England" || "Scotland" || "Wales" || "Ireland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_NHS_Authority).to be_kind_of String
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_longitude).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_latitude).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_constituency).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_electoral_region).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_primary_trust).to be_kind_of String
    end

    it "should return a region string" do
      expect(@postcodesio.get_region).to be_kind_of String
    end

    it "should return a parish string" do
      expect(@postcodesio.get_parish).to be_kind_of String
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_lsoa).to be_kind_of String
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_msoa).to be_kind_of String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_admin_district).to be_kind_of String
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_incode_string.length).to eq 3
    end

  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes(['B601JA', "M320JG", "NE301DP"]) #Add in array of postcodes
    end

    it "should respond with a status message of 200" do
      expect(@postcodesio.get_multi_status).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.get_multi_query(0)).to eq 'B601JA'
    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.get_multi_query(1)).to eq "M320JG"
    end

    it "should have a results hash" do
      expect(@postcodesio.get_multi_result(0)).to be_kind_of Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_multi_postcode_length(0)).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_multi_quality_value(0)).to be_kind_of Integer
      expect(@postcodesio.get_multi_quality_value(0)).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_multi_ordnance(0)).to be_kind_of Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_multi_country(0)).to include("England" || "Scotland" || "Wales" || "Ireland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_multi_NHS_Authority(0)).to be_kind_of String
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_multi_longitude(0)).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_multi_latitude(0)).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_multi_constituency(0)).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_multi_electoral_region(0)).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_multi_primary_trust(0)).to be_kind_of String
    end

    it "should return a region string" do
      expect(@postcodesio.get_multi_region(0)).to be_kind_of String
    end

    it "should return a parish string" do
      expect(@postcodesio.get_multi_parish(0)).to be_kind_of String
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_multi_lsoa(0)).to be_kind_of String
    end

    it "should return a msoa string" do
      expect(@postcodesio.get_multi_msoa(0)).to be_kind_of String
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@postcodesio.get_multi_admin_district(0)).to be_kind_of String
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_multi_incode_string(0).length).to eq 3
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.get_multi_incode_string(0).length).to be_between(3,4).inclusive
    end

    it "should have a results hash" do
      expect(@postcodesio.get_multi_result(1)).to be_kind_of Hash
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@postcodesio.get_multi_postcode_length(1)).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@postcodesio.get_multi_quality_value(1)).to be_kind_of Integer
      expect(@postcodesio.get_multi_quality_value(1)).to be_between(1,9)
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_multi_ordnance(1)).to be_kind_of Integer
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@postcodesio.get_multi_ordnance(1)).to be_kind_of Integer
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@postcodesio.get_multi_country(1)).to include("England" || "Scotland" || "Wales" || "Ireland")
    end

    it "should return a string value for NHS authority " do
      expect(@postcodesio.get_multi_NHS_Authority(1)).to be_kind_of String
    end

    it "should return a longitude float value" do
      expect(@postcodesio.get_multi_longitude(1)).to be_kind_of Float
    end

    it "should return a latitude float value" do
      expect(@postcodesio.get_multi_latitude(1)).to be_kind_of Float
    end

    it "should return a parliamentary constituency string" do
      expect(@postcodesio.get_multi_constituency(1)).to be_kind_of String
    end

    it "should return a european_electoral_region string" do
      expect(@postcodesio.get_multi_electoral_region(1)).to be_kind_of String
    end

    it "should return a primary_care_trust string" do
      expect(@postcodesio.get_multi_primary_trust(1)).to be_kind_of String
    end

    it "should return a region string" do
      expect(@postcodesio.get_multi_region(1)).to be_kind_of String
    end

    it "should return a parish string" do
      expect(@postcodesio.get_multi_parish(1)).to be_kind_of String
    end

    it "should return a parish string" do
      expect(@postcodesio.get_multi_parish(1)).to be_kind_of String
    end

    it "should return a lsoa string" do
      expect(@postcodesio.get_multi_lsoa(1)).to be_kind_of String
    end
    # admin ward and county are not documented however tested below

    it "should return a msoa string" do
      expect(@postcodesio.get_multi_lsoa(1)).to be_kind_of String
    end

    it "should return a admin_district string" do
      expect(@postcodesio.get_multi_admin_district(1)).to be_kind_of String
    end

    it "should return a incode string of three characters" do
      expect(@postcodesio.get_multi_incode_string(1).length).to eq 3
    end

    it "should return a incode string of 3-4 characters" do
      expect(@postcodesio.get_multi_incode_string(1).length).to be_between(3,4).inclusive
    end


  end


end
