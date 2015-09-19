module Algorithms
  class SelectionSort
    class << self
      def select_sort arr
        tmp_arr = []
        arr.size.times { tmp_arr << arr.delete(arr.max) }
        tmp_arr
      end
    end
  end
end

p Algorithms::SelectionSort.select_sort [3,2,5,100,66,55,44]
