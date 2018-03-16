require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE TABLE "links";')
  connection.exec("INSERT INTO links (id, url, title) VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links (id, url, title) VALUES(2, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links (id, url, title) VALUES(3, 'http://www.facebook.com', 'Facebook');")
end

task :setup do
  p "Creating databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(40));")
    puts "database created"
  end
end
