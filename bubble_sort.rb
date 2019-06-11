# frozen_string_literal: true

# check if we can swap - emits swap
def can_swap?(arr, index, max_i)
  index <= max_i && arr[index] > arr[index + 1]
end

# swap 2 elements between source and destination indices of an array
def swap(arr, index, max_i, swaps, block)
  if index <= max_i && block.call(arr[index], arr[index + 1]).positive?
    swaps += 1
    temp = arr[index]
    arr[index] = arr[index + 1]
    arr[index + 1] = temp
  end
  swaps
end

# merge swap with can_swap utility
def swap_if_possible(arr, index, max_index, swaps)
  if can_swap?(arr, index, max_index)
    swaps += 1
    temp = arr[index]
    arr[index] = arr[index + 1]
    arr[index + 1] = temp
  end
  swaps
end

def bubble_sort(arr)
  pass = 0
  loop do
    swaps = 0
    arr.each_with_index do |_, index|
      swaps = swap_if_possible(arr, index, arr.length - (2 + pass), swaps)
    end
    pass += 1
    break if swaps.equal?(0) || pass.equal?(arr.length)
  end
  arr
end

p bubble_sort([6, 5, 3, 9, 0])

def bubble_sort_by(arr, &block)
  pass = 0
  loop do
    swaps = 0
    arr.each_with_index do |_, index|
      swaps = swap(arr, index, arr.length - (2 + pass), swaps, block)
    end
    pass += 1
    break if swaps.equal?(0) || pass.equal?(arr.length)
  end
  arr
end

a = %w[hia hello hib arsrejdjshshsll hey bubble]
bubble_sort_by(a) do |left, right|
  left.length <=> right.length
end
p a
