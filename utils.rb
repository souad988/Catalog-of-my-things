module Utils 
    def self.data(attributes)
        data = {}
        attributes.each do |item|
            print "{item}: "
            data[item] = gets.chomp
        end
        data 
    end

    def self.list_data(object_controller)
        list_length = object_controller.list
        if list_length.zero?
            puts 'List is empty! Please add new items '
            return -1
        end
        print 'select index from list: '
        index = gets.chomp.to_i
    end
end