class NovaPoshta
  def self.get_regions
    response = HTTParty.post('https://api.novaposhta.ua/v2.0/json/',
                             body: {
                                 "apiKey": "95c086bdb267e828288a44ad4ea5ceec",
                                 "modelName": "Address",
                                 "calledMethod": "getCities",
                                 # "calledMethod": "getAreas",
                                 "methodProperties": {}
                             }.to_json,
                             headers: { 'Content-Type': 'application/json' } )
    response['data'].pluck('Description')
  end

  def self.get_warehouses(region)
    response = HTTParty.post('https://api.novaposhta.ua/v2.0/json/',
                             body: {
                                 "modelName": "AddressGeneral",
                                 "calledMethod": "getWarehouses",
                                 "apiKey": "95c086bdb267e828288a44ad4ea5ceec",
                                 "methodProperties": {
                                     "CityName": region
                                 }
                             }.to_json,
                             headers: { 'Content-Type': 'application/json' } )
    response['data'].pluck('Description')
  end
end