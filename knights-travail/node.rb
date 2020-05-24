class Node
    attr_accessor :value, :parent, :children
    def initialize(value = nil, parent = nil)
        @value = value
        @parent = parent
        @children = Array.new
    end
end