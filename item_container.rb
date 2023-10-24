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
    end 

    module ClassMethods
    end

    module InstanceMethods
        
        def add_item 
        end

        def remove_item 
        end

        def delete_items
        end 

        def method_missing(method, *args, &block)
        end 
        
    end
end

