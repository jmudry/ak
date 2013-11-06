n = 5
pi = []  #ciąg
@results = []

def wypisz(array)
  p array.join
  @results << array.join
end

def reverse pi, m
  i=1; j=m+1
  while i<j
    pi[j], pi[i] = pi[i],pi[j]
    i+=1; j-=1
  end
end

m = 1
# który raz wchodzi na ten poziom, maxymalnie może wracać na ten poziom m-1 razy i dokonywać reverse,
# inaczej następuje pójście w górę i zerowanie tego licznika
c = []
n.times {|i| pi[i+1] = i+1; c[i+1] = 0}

while m <= n
  c[m] +=1 # zwiększamy licznik wejść na ten poziom
  wypisz pi if m == 1
  if c[m] < m
    reverse pi, m-1
    m = 1  # na sam dół
  else
    c[m] = 0
    m += 1
  end
end

def silnia n
   n == 0 ? 1 : n * silnia(n-1)
end

p "Ilość wygenerowanych: #{@results.count} a powinno być: #{silnia n}"
p "unikalnych #{@results.uniq.count}"
if @results.count == @results.uniq.count
  p "OK"
else
  p "ERROR"
end