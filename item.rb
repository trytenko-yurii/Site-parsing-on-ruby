=begin
    This class is needed to:
    1)Implementing the constructor initialize
    2)Method info (which can receive a block at the input)
    3)Method to_s (for the correct operation of the :puts method)
    4)Method to_h (hash formation on the database and key names)
    5)Added attr_accessor for attributes (5 min)
=end

class Item
    attr_accessor :name, :description, :price, :color, :size, :picture_link, :size_guide_link
    
    def initialize(name, description, price, color, size, picture_link, size_guide_link)
        @name = name
        @description = description
        @price = price
        @color = color
        @size = size
        @size_guide_link = size_guide_link
        @picture_link = picture_link
    end 

    def info()
        if block.given?
            yield(self)
        else 
            puts "Block is not provided!"
        end
    end

    def to_s 
        "Picture: #{@picture_link} \n" +
        "Name: #{@name} \n" +
        "Price: #{@price} \n" + 
        "Description: #{@description} \n" +
        "Color: #{@color} \n" +
        "Size: #{@size} \n" + 
        "Size Guide: #{@size_guide_link}"
    end 

    def to_h
    {
        picture_link: @picture_link, 
        name: @name, 
        price: @price, 
        description: @description, 
        color: @color, 
        size: @size, 
        size_guide_link: @size_guide_link
    }
    end

end 