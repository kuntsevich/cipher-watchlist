class ItunesApi
  include HTTParty
  base_uri 'https://itunes.apple.com/search'

  def initialize(q, media_type = :movie)
    search_query = URI.encode q
    @options = { query: {term: search_query, media: media_type} }
  end

  def movies
    response      = self.class.get('', @options).parsed_response
    json_response = get_json_response response
    return [] if json_response.empty? || json_response['results'].empty?

    pasrsed_response json_response['results']
  end

  private

  def pasrsed_response json_response
    json_response.map do |movie|
      author_name = movie['artistName']
      price       = movie['collectionHdPrice']
      image_url   = movie['artworkUrl100']
      description = movie['longDescription']

      ItunesMovie.new(author_name, price, image_url, description)
    end
  end

  def get_json_response response
    begin
      JSON.parse(response)
    rescue JSON::ParserError, TypeError => e
      []
    end
  end

  class ItunesMovie
    attr_reader :author_name, :price, :image_url, :description

    def initialize(author_name, price, image_url, description)
      @author_name = author_name
      @price       = price
      @image_url   = image_url
      @description = description
    end
  end
end