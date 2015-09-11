module Algorithms
  class InsertionSort
    class << self
      def insert_sort arr
        arr.each_with_index do |item, idx|
          j = idx - 1
          while j > 0
            break if arr[j] <= item
            arr[j+1] = arr[j]
            j -= 1
          end
          arr[j+1] = item
        end
        arr
      end

      def insert_sort_one arr
        size = arr.size
        tmp_idx = 0
        1.upto(size-1) do |idx|
          tmp = arr[idx]
          idx.downto(0) do |j|
            tmp_idx = j
            break if arr[j-1] < tmp
            arr[j] = arr[j-1]
            j -= 1
          end
          arr[tmp_idx] = tmp
        end
        arr
      end
    end
  end
end

require "benchmark"
Benchmark.bm do |x|
  x.report{ 50000.times do Algorithms::InsertionSort.insert_sort_one [3,5,2,7,9,6]; end}
  x.report{ 50000.times do Algorithms::InsertionSort.insert_sort [3,5,2,7,9,6]; end}
end
