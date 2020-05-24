require_relative "node.rb"

class Board
    def initialize
        @depth_max = 5
    end

    def build_tree(piece, node, depth = 0)
        if depth > @depth_max
            return
        end

        piece.move(node.value).each do |next_value|
            if next_value[0] < 0 || next_value[0] > 7 || next_value[1] < 0 || next_value[1] > 7
                return
            end

            next_node = Node.new(next_value, node)
            node.children << next_node

            build_tree(piece, next_node, depth + 1)
        end
    end

    def move(piece, start, target)
        root = Node.new(start)
        build_tree(piece, root)

        queue = [root]
        nodes_visited = [root.value]

        until queue[0].value == target
            queue[0].children.each do |child|
                if !nodes_visited.include?(child.value)
                    queue << child
                end
            end
            queue.shift
            nodes_visited << queue[0].value
        end

        path = Array.new
        node = queue[0]
        until path.last == root.value
            path << node.value
            node = node.parent
        end

        p "Good job! You made it in #{path.size - 1} moves. Your path is:"
        path.reverse.each {|i| p i.inspect}
    end
end