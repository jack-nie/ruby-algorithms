require_relative 'deque'
module DS
  class Stack
    include Enumerable
    
    def initialize arr=[]
      @container = DS::Deque.new arr
    end

    def next
      @container.back
    end

    def push obj
      @container.push_back obj
    end
    alias_method :<<, :push

    def pop
      @container.pop_back
    end

    def size
      @container.size
    end

    def empty?
      @container.empty?
    end

    def each &block
      @container.each_backward(&block)
    end
  end
end
