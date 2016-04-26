class OdataController < ApplicationController

  # http://services.odata.org/V4/(S(v5hxkm2nja1yslvxvluqhuag))/TripPinServiceRW/

  def home
    response.headers['OData-Version'] = "4.0"
    render json: {"@odata.context" =>
                  "http://localhost:3000/metadata",
                  # "http://services.odata.org/V4/(S(v5hxkm2nja1yslvxvluqhuag))/TripPinServiceRW/$metadata",
    'value': [{:name => "Cities", :kind => "EntitySet", :url =>  "Cities"}]},
      content_type: "application/json;odata.metadata=minimal;odata.streaming=true"
  end

  def metadata
    response.headers['OData-Version'] = "4.0"

    render file: "./public/odata/metadata.xml", layout: false, content_type: 'application/xml'
  end
  # def metadata
  #    respond_to do |format|
  #      format.xml  # metadata.xml.builder
  #    end
  #  end

  def cities
    response.headers['OData-Version'] = "4.0"

    values = City.all.map { |c|
      {
        "@odata.id" => "http://localhost:3000/Cities(%d)" % c.id,
        "@odata.editLink" => "http://localhost:3000/Cities(%d)" % c.id,
        "Id"=> c.id,
        "Name"=> c.name
      }
    }


    render json:
    {
      "@odata.context" => 'http://localhost:3000/metadata#Cities',
      "value" =>      values
      #  [
      # {"@odata.id" => "http://localhost:3000/Cities(1)",
      #  "@odata.editLink" => "http://localhost:3000/Cities(1)",
      #  "Id"=>1,
      #  "Name"=> "Paris"}
      #  ]
    },content_type: "application/json;odata.metadata=minimal;odata.streaming=true"

  end
end
