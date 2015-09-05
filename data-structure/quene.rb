require_relative 'deque'
module DS
  class Quene
    include Enumerable

    def initialize arr=[]
      @container = DS::Deque.new arr
    end

    def next
      @container.front
    end

    def push obj
      @container.push_back obj
    end

    alias_method :<<, :push

    def pop
      @container.pop_front
    end

    def size
      @container.size
    end

    def empty?
      @container.empty?
    end

    def each &block
      @container.each_forward(&block)
    end
  end
end
