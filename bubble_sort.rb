def swap(arr, source, destination)
  temp = arr[source]
  arr[source] = arr[destination]
  arr[destination] = temp
end

def bubble_sort(arr)
  passes = arr.length
  pass = 0
  last_index = arr.length - 2
  while pass < passes
    arr.each_with_index { |ele, index|
      swap(arr, index, index + 1) if index <= last_index && arr[index] > arr[index + 1]
    }
    pass += 1
  end
  arr
end

p bubble_sort([6, 5, 3, 9, 0])
