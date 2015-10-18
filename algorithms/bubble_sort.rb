module  Algorithms
  class BubbleSort

    class << self

      def bubble_sort arr
        length = arr.length
        loop do
          swapped = false
          1.upto(length - 1) do |i|
            if arr[i - 1] > arr[i] 
              arr[i - 1], arr[i] = arr[i], arr[i - 1]
              swapped = true
            end
          end
          break unless swapped
        end
        arr
      end

      def bubble_sort_one arr
        length = arr.length
        loop do
          swapped = false
          1.upto(length - 1) do |i|
            if arr[i - 1] > arr[i] 
              arr[i - 1], arr[i] = arr[i], arr[i - 1]
              swapped = true
            end
          end
          length -= 1
          break unless swapped
        end
        arr
      end

    end
  end
end

p Algorithms::BubbleSort.bubble_sort([3,2,5,6,8,7])

