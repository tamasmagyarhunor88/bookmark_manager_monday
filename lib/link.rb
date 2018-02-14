require 'pg'

class Link
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def add_new_link(new_link)
    connection = PG.connect(dbname: 'bookmark_manager')
    add_link_to_database = connection.exec("INSERT INTO links(url) VALUES(new_link)")
  end
end
