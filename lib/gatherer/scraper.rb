module Gatherer
  class Scraper
    BASE_PATH = "http://gatherer.wizards.com"

    def initialize(params = {})
      @query = ''

      options = params.map do |k,v|
        send(k, v)
      end

      if options
        @query = URI.encode(options.join('&'))
      end
    end

    def url
      BASE_PATH + (@query.empty? ? '' : '?' + @query)
    end

    def set(name)
      "set=[#{name}]"
    end

    def page(number)
      "page=#{number}"
    end

    def multiverse_id(id)
      "multiverseid=#{id}"
    end
  end
end
