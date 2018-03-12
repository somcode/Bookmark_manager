require 'pg'

class Link
  def self.all
    connection = PG.connect :dbname => 'bookmark_manager', :user => 'hemesh'
  end
end
