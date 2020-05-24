require_relative "node.rb"

class Tree
    attr_accessor :root

    def initialize(arr)
        @root = nil
        build_tree(arr)
    end

    def build_tree(arr)
        arr.shuffle!
        arr.each do |node_value_to_add|
            add_node(node_value_to_add, @root)
        end
    end

    def add_node(node_value_to_add, current_node = nil)
        if @root.nil?
            @root = Node.new(node_value_to_add)
        elsif node_value_to_add < current_node.value
            if current_node.left_node.nil?
                current_node.left_node = Node.new(node_value_to_add, {parent: current_node})
            else
                add_node(node_value_to_add, current_node.left_node)
            end
        elsif node_value_to_add > current_node.value
            if current_node.right_node.nil?
                current_node.right_node = Node.new(node_value_to_add, {parent: current_node})
            else
                add_node(node_value_to_add, current_node.right_node)
            end
        else
            p "Node #{node_value_to_add} was not added."
        end
    end

    def insert(value, node = @root)
        return "Value already exists" if node.value == value
        check_node = value < node.value ? node.left_node : node.right_node
        if check_node.left_node.nil? && value < check_node.value
            check_node.left_node = Node.new(value)
        elsif check_node.right_node.nil? && value > check_node.value
            check_node.right_node = Node.new(value)
        else
            insert(value, check_node)
        end
    end

    def delete(value, node = @root)
        if @root.nil?
            @root
        elsif value < node.value
            node.left_node = delete(value, node.left_node)
        elsif value > node.value
            node.right_node = delete(value, node.right_node)
        else
            if node.left_node.nil? && node.right_node.nil?
                node = nil
            elsif node.left_node.nil?
                node = node.right_node
            elsif node.right_node.nil?
                node = node.left_node
            else
                temp_node = min(node.right_node)
                node.value = temp_node.value
                node.right_node = delete(temp_node.data, node.right_node)
            end
        end
    end


    def min(node = @root)
        node.left_node.nil? ? node : min(node.left_node)
    end

    def find(value, node=@root)
        return false if node.value == nil
        return node if node.value == value

        if node.value > value
            find(valuue, node.left_node)
        else
            find(value, node.right_node)
        end
    end

    def level_order(node = @root, &block)
        return if node.nil?

        queue = Queue.new
        queue << node

        while !queue.empty?
            current_node = queue.pop
            yield(current_node.value)
            queue << current_node.left_node if !current_node.left_node.nil?
            queue << current_node.right_node if !current_node.right_node.nil?
        end
    end

    def inorder(node = @root, &block)
        return if node.nil?

        inorder(node.left_node, &block)
        yield(node.value)
        inorder(node.right_node, &block)
    end

    def preorder(node = @root, &block)
        return if node.nil?

        yield(node.value)
        inorder(node.left_node, &block)
        inorder(node.right_node, &block)
    end

    def postorder(node = @root, &block)
        return if node.nil?

        inorder(node.left_node, &block)
        inorder(node.right_node, &block)
        yield(node.value)
    end

    def depth(node = @root)
        return -1 if node.nil?

        depth_left = depth(node.left_node)
        depth_right = depth(node.right_node)

        if depth_left > depth_right
            return_value = depth_left + 1
        else
            return_value = depth_right + 1
        end
    end

    def balanced?(node = @root)
        return if node.nil?

        depth_left = depth(node.left_node)
        depth_right = depth(node.right_node)

        if (depth_left - depth_right).abs > 1
            return_value = false
        else
            return_value = true
        end        
        return_value
    end

    def rebalance!
        arr = Array.new

        level_order {|i| arr << i}

        initialize(arr)
    end
end