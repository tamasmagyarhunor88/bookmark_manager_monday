require 'pg'

class Link
  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.add_new_link(new_link)
    add_link_to_database = DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
  end
end
