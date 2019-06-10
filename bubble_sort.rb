def swap(arr, source, destination)
  temp = arr[source]
  arr[source] = array[destination]
  arr[destination] = temp
end

def bubble_sort(arr)
  passes = arr.length
  pass = 0
  last_index = arr.length - 2
  # n = arr.length
  # i = 0
  #while (pass < passes)
  arr.each_with_index { |ele, index|
    p index
    swap(arr, index, index + 1) if index <= last_index && arr[index] > arr[index + 1]
  }
  p arr
  #end

  # for element in arr
  #   p element
  # end
end

p bubble_sort([6, 5, 4]) # = 3, 2,
