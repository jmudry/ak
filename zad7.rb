# Zadanie 7
# Zaimplementować rekurencyjną wersję algorytmu 12 – 3 pkt - termin 6.11

n = 3
@results = []

def wypisz sets
  str = ''
  for set in sets
    str += "{#{set.join(',')}}"
  end

  @results << str
  p str
end

def add_el pi, i, m
  new = Marshal.load(Marshal.dump(pi)) #clonowanie obiektu dogłębnie :)
  new[i] = [] if pi[i].nil?
  new[i] << m
  new
end

def fun n, m = n, pi = [], r = false
  k = n - m + 1
  count = pi.uniq.compact.count+1
  count.times do |j|
    i = !r ? j : (count - j -1) #odwrócenie dla co drugiego
    if k == n
      wypisz add_el(pi, i, k)
    else
      fun(n, m-1, add_el(pi, i, k), i % 2 == 1)
    end
  end

end

fun n

p "wszystkich = #{@results.count} unikalnych #{@results.uniq.count}"