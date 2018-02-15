require 'pg'
require 'uri'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links;")
    result.map do |row|
      Link.new(row['id'], row['url'], row['title'])
    end
  end

  def self.add_new_link(new_link, title)
    return false unless validate(new_link)
    DatabaseConnection.query("INSERT INTO links(url, title) VALUES('#{new_link}', '#{title}');")
  end

  private

  def self.validate(uri)
    uri = URI.parse(uri)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end
end
