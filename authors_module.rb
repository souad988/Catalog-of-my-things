require 'json'
require_relative './classes/author'

module Author 
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