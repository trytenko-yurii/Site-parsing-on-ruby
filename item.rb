=begin
    This class is needed to:
    1)Implementing the constructor initialize
    2)Method info (which can receive a block at the input)
    3)Method to_s (for the correct operation of the :puts method)
    4)Method to_h (hash formation on the database and key names)
    5)Added attr_accessor for attributes (5 min)
=end

class Item
    attr_accessor :name, :description, :price, :color, :size, :picture_link

    def initialize(name, description, original_price, current_price, size, picture_link)
        @name = name
        @description = description
        @original_price = original_price
        @current_price = current_price
        @size = size
        @picture_link = picture_link
    end

    def info(&block)
        if block_given?
            block.call(self)
        else
            puts "Name: #{@name}"
            puts "Description: #{@description}"
            puts "Original Price: #{@original_price}"
            puts "Current Price: #{@current_price}"
            puts "size: #{@size}"
        end
    end

    def to_s
        "Picture: #{@picture_link} \n" +
        "Name: #{@name} \n" +
        "Description: #{@description} \n" +
        "Original Price: #{@original_price} \n" +
        "Current Price: #{@current_price} \n" +
        "Size: #{@size} \n"
    end

    def to_h
    {
        picture_link: @picture_link,
        name: @name,
        original_price: @original_price,
        current_price: @current_price,
        description: @description,
        size: @size
    }
    end

end
