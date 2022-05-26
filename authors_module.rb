require 'json'
require_relative './classes/author'

module AuthorsModule
  def load_authors
    data = []
    file = './authors.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |author|
        data.push(Author.new(author['first_name'], author['last_name']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def create_author
    data = []
    @authors.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    open('./authors.json', 'w') { |f| f << JSON.generate(data) }
  end
end
