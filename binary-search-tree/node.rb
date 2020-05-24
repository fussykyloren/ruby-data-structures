class Node
    attr_accessor :value, :left_node, :right_node, :parent
    def initialize(value = nil, related_nodes = {})
        @value = value
        @left_node = related_nodes[:left_node]
        @right_node = related_nodes[:right_node]
        @parent = related_nodes[:parent]
    end
end