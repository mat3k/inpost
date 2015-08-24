module Inpost

  class MachinesAPI

    ENDPOINT_URL = 'https://api-pl.easypack24.net/v4/machines'

    def initialize(endpoint_url: ENDPOINT_URL, cache_store: Inpost::CacheFileStore)
      @endpoint_url = endpoint_url
      @cache = cache_store
    end

    def machines
      response = request(:get)
      machine_collection = parse_response(response)
      @cache.write(machine_collection)
    end

    def machine(id)
      machines = machines['_embedded']['machines'].find do |machine|
        machine['id'] == id
      end
    end

    private

    def request(method=:get)
      RestClient::Request.execute(method: method, url: @endpoint_url)
    end

    def parse_response(response)
      JSON.parse(response)
    end

  end

end