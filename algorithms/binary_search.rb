module Algorithms
  class BinarySearch
    class << self
      ##to be completed
      def binary_search_rec arr,left, right, target
        return false if arr.nil?
        if left <= right
          mid = (left + right) / 2
          return mid if arr[mid] == target
          binary_search_rec arr, 0, mid - 1, target if arr[mid] > target
          binary_search_rec arr, mid + 1, right, target if arr[mid] < target
        else
          return false
        end
      end

      def binary_search arr, left, right, target
        while left <= right
          mid = (left + right)/2
          return mid if arr[mid] == target
          right = mid - 1 if arr[mid] > target
          left  = mid + 1 if arr[mid] < target
        end
        return false
      end
    end
  end
end

arr = [1,2,3,4,5,6,7,8, 11]
p Algorithms::BinarySearch.binary_search_rec(arr, 0, 8, 5)
p Algorithms::BinarySearch.binary_search(arr, 0, 8, 20)

