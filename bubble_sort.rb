# frozen_string_literal: true

# check if we can swap - emits swap
def can_swap?(arr, i, max_i)
  i <= max_i && arr[i] > arr[i + 1]
end

# swap 2 elements between source and destination indices of an array
def swap(arr, source, destination, swaps)
  swaps += 1
  temp = arr[source]
  arr[source] = arr[destination]
  arr[destination] = temp
  swaps
end

# merge swap with can_swap utility
def swap_if_possible(arr, i, max_index, swaps)
  if can_swap?(arr, i, max_index)
    swaps += 1
    temp = arr[i]
    arr[i] = arr[i + 1]
    arr[i + 1] = temp
  end
  swaps
end

def bubble_sort(arr)
  pass = 0
  loop do
    swaps = 0
    arr.each_with_index do |_, i|
      swaps = swap_if_possible(arr, i, arr.length - (2 + pass), swaps)
    end
    pass += 1
    break if swaps.equal?(0) || pass.equal?(arr.length)
  end
  arr
end

p bubble_sort([6, 5, 3, 9, 0])

def bubble_sort_by(arr)
  pass = 0
  loop do
    swaps = 0
    max_i = arr.length - (2 + pass)
    arr.each_with_index do |ele, i|
      swaps = swap(arr, i, i + 1, swaps) if i <= max_i && (yield ele, arr[i + 1]).positive?
    end
    pass += 1
    break if swaps.equal?(0) || pass.equal?(arr.length)
  end
  arr
end

a = %w[hia hello hib arsrejdjshshsll hey bubble]
bubble_sort_by(a) do |left, right|
  left.length - right.length
end
p a
