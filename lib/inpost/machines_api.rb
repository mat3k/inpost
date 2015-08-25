module Inpost

  class MachinesAPI

    ENDPOINT_URL = 'https://api-pl.easypack24.net/v4/machines'

    def initialize(endpoint_url: ENDPOINT_URL, cache_store: Inpost::CacheFileStore.new)
      @endpoint_url = endpoint_url
      @cache = cache_store
    end

    def machines
      get_from_cache || write_to_cache(get_from_http)
    end

    def machine(id)
      machines.find { |machine| machine['id'] == id }
    end

    protected

    def request(method=:get, url)
      RestClient::Request.execute(method: method, url: url)
    end

    def parse_response(response)
      JSON.parse(response)['_embedded']['machines']
    end

    def get_from_cache
      return nil unless @cache
      @cache.read
    end

    def write_to_cache(data)
      @cache.write(data) if @cache
    end

    def get_from_http
      parse_response(request(:get, @endpoint_url))
    end

  end

end