# Algorytm 12 z wykładu w wersji nierekurencyjnej

blok = []
nast = []
poprz = []
pr = []
n = 5
@c = 0
@rozwiazania = []

def wypisz blok
  str = ''
  for i in 1..blok.count-1
    elementy =[]
    for j in 1..blok.count-1
      elementy << j if blok[j] == i
    end
    str += "{#{elementy.join(',')}}"  if !elementy.empty?
  end

  @rozwiazania << str
  p str
end


n.times{|i| blok[i+1] = 1; pr[i+1] = true}
nast[1] = 0
wypisz blok

j=n

while j > 1
  k = blok[j]

  if pr[j]
    if nast[k] == 0
      nast[k] = j
      poprz[j] = k
      nast[j] = 0
    end
    if nast[k] > j
      poprz[j] = k
      nast[j] = nast[k]
      poprz[nast[j]] = j
      nast[k] = j
    end
    blok[j] = nast[k]
  else
    blok[j] = poprz[k]
    if k == j
      if nast[k] == 0
        nast[poprz[k]] = 0
      else
        nast[poprz[k]] = nast[k]
        poprz[nast[k]] = poprz[k]
      end
    end
  end

  wypisz blok
  j = n
  while (j > 1) && ((pr[j] && (blok[j] == j)) || (!pr[j] && (blok[j] == 1)))
    pr[j] = !pr[j]
    j -=1
  end
end

p "wszystkich = #{@rozwiazania.count}"