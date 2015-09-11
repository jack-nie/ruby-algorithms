$: << File.join(File.expand_path(File.dirname(__FILE__)), '../algorithms')
require 'insert_sort'
require "benchmark"

Benchmark.bm do |x|
  x.report{ 50000.times do Algorithms::InsertionSort.insert_sort_one [3,5,2,7,9,6]; end}
  x.report{ 50000.times do Algorithms::InsertionSort.insert_sort [3,5,2,7,9,6]; end}
end
