module Algorithms
  class MergeSort
    class << self
      def merge_sort array
        return array if array.size <= 1
        left = array.first(array.size/2)
        right = array.last(array.size - array.size/2) 
        merge(merge_sort(left), merge_sort(right))
      end
     
      def merge(left, right)
        sorted = []
        until left.empty? or right.empty?
          sorted << (left.first <= right.first ? left.shift : right.shift)
        end
        sorted + left + right
      end
    end 
  end
end
array = [1,3,4,5,62,33,23,44,24]
p Algorithms::MergeSort.merge_sort array
