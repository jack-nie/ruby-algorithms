module Algorithms
  class QuickSort
    CUT_OFF = 3
    class << self
      def quick_sort arr
        (x = arr.pop) ? quick_sort(arr.select { |i| i <= x }) + [x] + quick_sort(arr.select { |i| i > x }) : []
      end

      
      #Not quite implemented, to be fixed, bug may come from the way pass a params
      #via value or reference. That is the median method need a fixing?
      def quick_sort_two arr, left, right
        if (left + CUT_OFF  < right)
          p = median(arr, left, right)
          arr[p], arr[right] = arr[right], arr[p]
          pivot = arr[right]
          i = left 
          j = right - 1
          loop do
            i += 1 while i < j and arr[i] < pivot
            j -= 1 while i < j and arr[j] > pivot
            break if i >= j
            arr[i], arr[j] = arr[j], arr[i]
            i += 1
            j -= 1
          end

          arr[i], arr[right] = arr[right], arr[i] if arr[i] > pivot

          quick_sort_two arr, left, i - 1 if left < i
          quick_sort_two arr, i + 1, right if right > i
        else
          insertion_sort arr, right - left + 1
        end
        arr
      end

      #Median-of-Three-Partition
      def median arr, left, right
        center = (left + right) / 2
        arr[left], arr[center] = arr[center], arr[left] if arr[left] > arr[center]
        arr[left], arr[right] = arr[right], arr[left] if arr[left] > arr[right]
        arr[center], arr[right] = arr[right], arr[center] if arr[right] > arr[center]
        center
      end

      def insertion_sort arr, length
        for i in 0..(length - 1) do
          tmp = arr[i]
          p = i
          i.downto(0) do |j|
            p = j
            break if arr[j - 1] < tmp
            arr[j] = arr[j - 1]
          end
          arr[p] = tmp
        end
        arr
      end

      def sort arr
        length = arr.size
        quick_sort_two arr, 0, length - 1
      end

      #quick_sort_three, using the last element as pivot
      def quick_sort_three arr, left, right
        if left < right
          pivot_idx = partition arr, left, right
          quick_sort_three arr, left, pivot_idx - 1
          quick_sort_three arr, pivot_idx + 1, right
        end
        arr
      end

      #Lomuto partition 
      def partition arr, left, right
        pivot = arr[right]
        idx   = left
        left.upto(right - 1) do |tmp_idx|
          if arr[tmp_idx] <= pivot
            arr[idx], arr[tmp_idx] = arr[tmp_idx], arr[idx]
            idx += 1
          end
        end
        arr[idx], arr[right] = arr[right], arr[idx]
        idx
      end

      #quick_sort_four, also use the last element as pivot
      def quick_sort_four arr, left, right
        if left < right
          pivot_idx = partition_two arr, left, right
          quick_sort_four arr, left, pivot_idx
          quick_sort_four arr, pivot_idx + 1, right
        end
        arr
      end
      
      #Hoare partition
      def partition_two arr, left, right
        pivot = arr[left]
        i = left 
        j = right 
        loop do
          j -= 1 while arr[j] > pivot 
          i += 1 while arr[i] < pivot 

          return j if i >= j
          arr[i], arr[j] = arr[j], arr[i]
        end
      end

    end
  end
end

Algorithms::QuickSort.sort([3, 5, 7, 2, 6, 24, 9, 8, 10, 12]).each(&method(:p))
p "##############"
Algorithms::QuickSort.quick_sort_three([3, 5, 7, 2, 6, 9, 55, 8, 10, 12], 0 , 9).each(&method(:p))
p "##############"
Algorithms::QuickSort.quick_sort_four([3, 5, 24, 2, 6, 9, 8, 10, 12], 0 , 8).each(&method(:p))
p "##############"
Algorithms::QuickSort.insertion_sort([3, 5, 2, 6, 9, 8, 10, 12], 8).each(&method(:p))
