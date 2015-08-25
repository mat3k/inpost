module Inpost

  class CacheFileStore
    FILENAME = '.inpost_cache'

    def initialize(filename: FILENAME)
      @filename = filename
      @data = nil
    end

    def write(data)
      File.write(@filename, serialize(data))
      @data ||= data
    end

    def read
      @data ||= unserialize(File.read(@filename))
    rescue Errno::ENOENT
      return nil
    end

    protected

    def serialize(data)
      YAML.dump({_cache_time: Time.now, data: data})
    end

    def unserialize(data)
      YAML.load(data)[:data]
    end
  end

end