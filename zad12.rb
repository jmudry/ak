require 'benchmark'

puts Benchmark.measure {
  n = 1000
  tab = [nil,1,1]+[0]*(n-3)

  for i in 2..n
    if !tab[i].nil? and tab[i] == 0
      tab[i] = nil
    elsif !tab[i].nil?
      for j in 1..(i-1) do
        if !tab[j].nil? and !tab[i+j].nil?
            tab[j+i]+=1
            tab[i+j]=nil if tab[i+j] > 1
        end
      end
    end
  end

  count = 0
  for i in 1..n
   # p i if !tab[i].nil?
    count +=1 if !tab[i].nil?
  end

  p "Wszystkich jest: #{count}"
}