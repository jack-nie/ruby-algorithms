module Algorithms
  class ShellSort
    class << self
      
      #shell sort using Hibbard increment sequence
      def shell_sort arr
        length = arr.length
        k = (Math.log2 length).to_i
        while k > 0
          gap = hibbard_gap k
          p gap
          0.upto(length - 1) do 
            (0...length - gap).step(gap) do |j|
              arr[j], arr[j + gap] = arr[j + gap], arr[j] if arr[j] >= arr[j + gap]
            end
          end
          break if gap == 1
          k -= 1
        end
        arr
      end

      def hibbard_gap k
        2 ** (k - 1) - 1
      end
 
    end
  end
end

p Algorithms::ShellSort.shell_sort [2,3,4,6,5,74,5,7,20,34,23]
p Algorithms::ShellSort.shell_sort ((1..100).to_a + (20..80).to_a).shuffle.sample(65)
