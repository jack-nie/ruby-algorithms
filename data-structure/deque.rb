module DS
  class Deque

    include Enumerable
    
    Node = Struct.new(:left, :right, :obj)

    def initialize arr=[]
      @front = nil
      @back  = nil
      @size  = 0
      arr.each(&method(:push_back))
    end

    def empty?
      @size == 0
    end

    def clear
      @front = @back = nil
      @size = 0
    end

    def size
      @size
    end

    alias_method :length, :size

    def front
      @front && @front.obj
    end

    def back
      @back && @back.obj
    end

    def push_front obj
      node = Node.new nil, nil, obj
      if @front
        node.right = @front
        @front.left = node
        @front = node
      else
        @front = @back = Node
      end
      @size += 1
      obj
    end

    def push_back obj
      node = Node.new nil, nil, obj
      if @back
        node.left = @back
        @back.right =node
        @back = node
      else
        @front = @back = node
      end
      @size += 1
      obj
    end

    def pop_front
      return nil unless @front
      if @size == 1
        clear
        return node.obj
      else
        @front.right.left = nil
        @front = @front.right
      end
      @size -= 1
      node.obj
    end

    def pop_back
      return nil unless @back
      if @size == 1
        clear
        return node.obj
      else
        @back.left.right = nil
        @back = @back.left
      end
      @size -= 1
      node.obj
    end
    
    def each_forward
      return unless @front
      node = @front
      while node
        yield node.obj
        node = node.right
      end
    end

    def each_backward
      return unless @back
      node = back
      while node
        yield node.obj
        node = node.left
      end
    end
  end
end
