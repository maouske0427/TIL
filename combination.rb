n = 5
arr1 = (1..n-1).to_a
arr2 = (1..n).to_a
arr_answer = []

(0..(n-2)).each do |i|
  (i..(n-1)).each do |j|
    if arr1[i] != arr2[j]
      arr_answer.push([arr1[i], arr2[j]])
    end
  end
end
