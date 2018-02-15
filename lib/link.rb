require 'pg'
require 'uri'

class Link

  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map do |row|
      Link.new(row['id'], row['url'])
    end
  end

  def self.add_new_link(new_link)
    return false unless validate(new_link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
  end

  private

  def self.validate(uri)
    uri = URI.parse(uri)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end
end
