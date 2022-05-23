class Item
    def initialize(publish_date, archived, id=nil)
        @id = id.nil? ? Random.rand(1..1000) : id
        @publish_date = publish_date
        @archived = archived
    end
    
end