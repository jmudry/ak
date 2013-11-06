n=4
@count = 0
@t = []

@results = []

def wypisz(array)
  p array.join
  @results << array.join
end

def reverse m
  i=1; j=m+1
  while i<j
    @t[j], @t[i] = @t[i],@t[j]
    i+=1
    j-=1
  end
end

def antylex m
  if m == 1
    wypisz @t
  else
    for i in 1..m do
      antylex(m-1)
      if i < m
       # @t[i], @t[m] = @t[m],@t[i]
        p "rev (#{m-1})"
        reverse(m-1)
      end
    end
  end

  p "antylex (#{m})"
end


def silnia n
  return 1 if n == 0
  n * silnia(n-1)
end

n.times {|i| @t[i+1] = i+1}
antylex n
p "Ilość wygenerowanych: #{@results.count} a powinno być: #{silnia n}"
p "unikalnych #{@results.uniq.count}"
if @results.count == @results.uniq.count
  p "OK"
else
  p "ERROR"
end






