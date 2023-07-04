array = [1, 5, 9, 7, 3, 10, 8, 9, 100]

def chapter01_01(number_array)
size = number_array.size
max = size - 1
(0..(max-1)).each do |i|
  max.downto(i+1) do |j|
    if number_array[j] < number_array[j-1]
      tmp = number_array[j-1]
      number_array[j-1] = number_array[j]
      number_array[j] = tmp
    end
  end
end
end

p chapter01_01(array)
