module DS

  Node = Struct.new(:data, :left, :right)

  class BinaryTree
    include Enumerable

    attr_accessor :root

    def initialize value = nil
      @root = Node.new(value, nil, nil) unless value.nil?
    end

    def empty?
      data.nil? && left.nil? && right.nil?
    end

    def insert value
      tmp_node = Node.new(value, nil, nil)
      @root    = tmp_node and return if @root.nil?
      insert_at_node @root, tmp_node
    end
    alias_method :<<, :insert

    def insert_at_node tree_node, tmp_node
      tree_node = tmp_node and return if tree_node.nil?
      case tree_node.data <=> tmp_node.data
      when 1
        return insert_at_node(tree_node.left, tmp_node) unless tree_node.left.nil?
        return tree_node.left = tmp_node
      when -1
        return insert_at_node(tree_node.right, tmp_node) unless tree_node.right.nil?
        return tree_node.right = tmp_node
      when 0
        tree_node
      end
    end

    def find tree_node = @root, value
      return nil if tree_node.nil?

      case tree_node.data <=> value
      when 1  then return find tree_node.left, value
      when -1 then return find tree_node.right, value
      when 0  then return tree_node
      end
    end

    def find_min node = @root
      return node if node.left.nil?
      find_min node.left
    end

    def find_max node = @root
      return node if node.right.nil?
      find_max node.right
    end

    ##To be fixed...something got wrong!!!
    def delete tree_node = @root, value
      tree_node.right = delete(tree_node.right, value) if tree_node && tree_node.data > value
      tree_node.left  = delete(tree_node.left, value) if tree_node && tree_node.data  < value 
      tree_node       = remove(tree_node) if tree_node && tree_node.data == value
      tree_node
    end

    def remove tree_node
      tree_node = nil if tree_node.left.nil? && tree_node.right.nil?
      tree_node = tree_node.left if !tree_node.left.nil? && tree_node.right.nil?
      tree_node = tree_node.right if tree_node.left.nil? && !tree_node.right.nil?
      tree_node = replace_parent(tree_node) if tree_node.left && tree_node.right
      tree_node
    end

    def replace_parent tree_node
      tree_node.data  = successor_value(tree_node.right)
      tree_node.right = update(tree_node.right)
      tree_node
    end

    def successor_value tree_node
      successor_value tree_node.left unless node.left.nil?
      tree_node.value
    end

    def update tree_node
      tree_node.left = update(tree_node) unless tree_node.left.nil?
      tree_node.right
    end


    def each order = "in_order", &block
      public_send "#{order}_traverse_tree".to_sym, @root, &block
    end

    def in_order_traverse_tree node, &block
      return if node.nil?
      in_order_traverse_tree node.left, &block
      yield node.data if block_given?
      in_order_traverse_tree node.right, &block
    end

    def pre_order_traverse_tree node, &block
      return if node.nil?
      yield node.data if block_given?
      pre_order_traverse_tree node.left, &block
      pre_order_traverse_tree node.right, &block
    end

    def post_order_traverse_tree node, &block
      return if node.nil?
      post_order_traverse_tree node.left, &block
      post_order_traverse_tree node.right, &block
      yield node.data if block_given?
    end

    def inspect
      "#{root.data}::#{root.left}|#{root.right}"
    end
  end
end

