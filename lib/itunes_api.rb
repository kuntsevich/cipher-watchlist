class ItunesApi
  include HTTParty
  base_uri 'https://itunes.apple.com/search'

  def initialize(q, media_type = :movie)
    search_query = URI.encode q
    @options = { query: {term: search_query, media: media_type} }
  end

  def movies
    response = self.class.get('', @options).parsed_response
    return [] if response.empty?

    pasrsed_response response
  end

  private

  def pasrsed_response response

  end

  class ItunesMovie
    attr_reader :name, :price,

    def initialize(name)
      @name        = name
      @price       = price
      @image       = image
      @description = description
    end
  end
end