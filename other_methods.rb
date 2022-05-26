require 'json'

module OtherMethods
  def read_data(dir)
    if File.exist?("storage/#{dir}")
      data = File.read("storage/#{dir}")
      return JSON.parse(data, create_additions: true)
    end
    []
  end

  def store_data(dir, data)
    File.write("storage/#{dir}", JSON.generate(data, create_additions: true))
  end
end
