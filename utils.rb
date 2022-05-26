module Utils
  def self.data(attributes)
    data = {}
    attributes.each do |item|
      print "#{item} : "
      data[item] = gets.chomp
    end
    data
  end

  def self.list_data(object_controler)
    list_length = object_controler.list
    if list_length.zero?
      puts 'Please add new items '
      return -1
    end
    print 'select index from the list : '
    index = gets.chomp
    index.to_i
  end
end
