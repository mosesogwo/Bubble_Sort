# frozen_string_literal: true
# swap 2 elements between source and destination indices of an array
def swap(arr, source, destination)
  temp = arr[source]
  arr[source] = arr[destination]
  arr[destination] = temp
end

def bubble_sort(arr)
  passes = arr.length
  pass = 0
  last_index = passes - (2 + pass)
  while pass < passes
    swaps = 0
    arr.each_with_index do |ele, index|
      if index <= last_index && ele > arr[index + 1]
        
        swap(arr, index, index + 1)
        swaps += 1
      end
    end
    break if swaps.equal?(0)
    pass += 1
    last_index = passes - (2 + pass)
  end
  arr
end

p bubble_sort([6, 5, 3, 9, 0])

def bubble_sort_by(arr)
  passes = arr.length
  pass = 0
  last_index = passes - (2 + pass)
  while pass < passes
    swaps = 0
    arr.each_with_index do |ele, index|
      if index <= last_index
        diff = yield ele, arr[index + 1]
        swap(arr, index, index + 1) and swaps += 1 if diff.positive?
      end
    end
    break if swaps.equal?(0)
    pass += 1
    last_index = passes - (2 + pass)
  end
  arr
end

a = %w(hia hello, hib, arsrejdjshshsll, hey, bubble)
bubble_sort_by(a) do |left, right|
  left.length - right.length
end
p a
