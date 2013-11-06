n = 4

@tab = []
@results = []

def wypisz(array)
  p array.join
  @results << array.join
end

def bmi m, i
  if (m % 2 == 0) and m > 2
    if i < m - 1
      b = i
    else
      b = m-2
    end
  else
    b = m-1
  end
  b
end

def bmi2 m, i
  m % 2 == 0 ? i : m-2
end

def perm m
   if  m == 1
     wypisz @tab
   else
    for i in 1..m do
      perm(m-1)
      if i < m
        index = bmi2(m, i)
        @tab[index], @tab[m] = @tab[m], @tab[index]
      end
    end
   end
end

for i in 1..n do
  @tab[i] = i
end





perm n

p "ilość wszystkich #{@results.count}, w tym unikalnych #{@results.uniq.count}"

