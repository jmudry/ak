require 'benchmark'

tab=[]
c_poz=[]  # wskazuje którą z n-i+1 pozycji element i zajmuje względem el. i+1..n
in_forward=[] # czy element jest przesuwany w przód
n=4
@results=[] # wygenerowane permutacje w celu sprawdzenia uniklaności

def wypisz(array)
  p array.join
  @results << array.join
end

puts Benchmark.measure {
  # inicjalizacja
  for i in 1..n
    tab[i]=i
    c_poz[i]=1
    in_forward[i]=true
  end
  c_poz[n]=0

  wypisz tab

  i=1
  while i < n do
    i=1; x=0
    while c_poz[i] == n-i+1 do
      in_forward[i] = !in_forward[i]  # odbijamy typka
      c_poz[i] = 1   # zerujemy jego ilość w tym ustawieniu kolegów
      x = x+1 if in_forward[i]
      i+=1
    end

    if i < n
      # jak w przód to zmien od początku jak w tył to od końca
      k = in_forward[i] ? c_poz[i]+x : n-i+1 - c_poz[i]+x
      tab[k],tab[k+1] = tab[k+1], tab[k] # zamień
      wypisz tab
      c_poz[i] = c_poz[i]+1
    end
  end
}

p "ilość wszystkich #{@results.count}, w tym unikalnych #{@results.uniq.count}"