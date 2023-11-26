=begin
    This class is needed to:
    1)Implementing self.included method
    2)Implementing ClassMethods module
    3)Implementing InstanceMethods module
        Add the following methods to the instance module
        3.1)add_item method
        3.2)remove_item method
        3.3)delete_items method
        3.4)method_missing to output the show_all_item method
=end

module ItemContainer

    def self.included(base)
        base.extend(ClassMethods)
        base.include(InstanceMethods)
    end

    module ClassMethods

    end

    module InstanceMethods

        def initialize
            @items = []
        end

        def add_item(item)
            @items << item
            puts "#{item} added to the container."
        end

        def remove_item(item)
            @items.delete(item)
            puts "#{item} removed from the container."
        end

        def delete_items(item)
            @items = []
            puts "All items deleted from the container."
        end

        def method_missing(method, *args, &block)
            if method.to_s == 'show_all_items'
                show_all_items
            else
                super
            end
        end

        private

        def show_all_items
            puts "Items in the container:"
            @items.each { |item| puts "- #{item}" }
        end

    end
end
