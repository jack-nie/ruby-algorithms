module Algorithms
  class HeapSort
    class << self
      def heapify array, idx, size
        left_idx = 2 * idx + 1
        right_idx = 2 * idx + 2
        bigger_idx = idx
        bigger_idx = left_idx if left_idx < size && array[left_idx] > array[idx]
        bigger_idx = right_idx if right_idx < size && array[right_idx] > array[bigger_idx]
        if bigger_idx != idx
          array[idx], array[bigger_idx] = array[bigger_idx], array[idx]
          heapify array, bigger_idx, size
        end
      end

      def build_heap array
        last_parent_idx = array.length / 2 - 1
        i  = last_parent_idx
        while i >= 0
          heapify array, i, array.size
          i = i - 1
        end
      end

      def heap_sort array
        return array if array.size <= 1
        size = array.size
        build_heap array
        while size > 0
          array[0], array[size - 1] = array[size - 1], array[0]
          size = size - 1
          heapify array, 0, size
        end
        return array
      end
    end
  end
end


array = [1,3,4,5,6,10,13,30,15,16,24]
p Algorithms::HeapSort.heap_sort array
