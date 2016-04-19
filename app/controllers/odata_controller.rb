class OdataController < ApplicationController

    # http://services.odata.org/V4/(S(v5hxkm2nja1yslvxvluqhuag))/TripPinServiceRW/

  def home
    response.headers['OData-Version'] = "4.0"
    render json: {"@odata.context" => 
        "http://localhost:3000/$metadata",
        # "http://services.odata.org/V4/(S(v5hxkm2nja1yslvxvluqhuag))/TripPinServiceRW/$metadata",
      'value': [{:name => "Cities", :kind => "EntitySet", :url =>  "Cities"}]}, 
      content_type: "application/json;odata.metadata=minimal;odata.streaming=true"
  end

  def metadata
   render file: "./public/odata/metadata.xml", layout: false, content_type: 'text/xml'
  end
end
