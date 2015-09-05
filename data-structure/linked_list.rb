module DS
  class LinkedList
    include Enumerable
    attr_accessor :head 
    Node = Struct.new(:data, :next)
    
    def initialize  value
      @head = Node.new(value, nil)
    end

    def push value
      node = @head
      while node.next
        node = node.next
      end
      node.next = Node.new(value, nil)
      self
    end

    def delete value
      node = @head
      if node.data == value
        @head = @head.next
      else
        node = @head
        while node && node.next && node.next.data 
          node = node.next
        end
        if node && node.next
          node.next = node.next.next
        end
      end
    end

    def is_last node
      node.next == nil
    end

    def find value
      node = @head
      while node && node.next && node.next.data != value
        node = node.next
      end
      node
    end


    def each 
      return nil unless @head
      node = @head
      while node
        yield node
        node = node.next
      end
    end        
  end
end
