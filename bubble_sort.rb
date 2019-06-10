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
    arr.each_with_index { |ele, index|
      swap(arr, index, index + 1) and swaps += 1 if index <= last_index && arr[index] > arr[index + 1]
    }
    break if swaps.equal?(0)
    p arr
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
    arr.each_with_index { |ele, index|
      if index <= last_index
        diff = yield arr[index], arr[index+1]
        swap(arr, index, index + 1) and swaps += 1 if diff > 0
      end
    }
    break if swaps.equal?(0)
    p arr
    pass += 1
    last_index = passes - (2 + pass)
  end
  arr
end

bubble_sort_by(["hia","hello", "hib", "arsrejdjshshsll", "hey","bubble"]) do |left,right|
  left.length <=> right.length
end

