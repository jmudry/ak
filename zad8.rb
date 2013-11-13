# 8. Skonstruować i zaimplementować algorytm znajdujący wszystkie k-elementowe
# kompozycje liczby n – 2 pkt – termin 13.11
N = 8
K = 4
a = []
@count = 0

K.times{|i| a[i] = i}
a[K] = N

def wypisz a
  s = []
  1.upto(a.count-1) {|i| s << a[i] - a[i-1]}
  @count+=1
  print "(#{s.join(',')})\n"
end
print "****** #{K}-elementowe kompozycje liczby #{N} ******\n"

p = K-1
while p >= 1
  wypisz a
  p = a[K-1] == N-1 ? p-1 : K-1
  (K-1).downto(p) {|i| a[i] = a[p] + i - p +1} if p >= 1
end

print "Wszystkich kompozycji #{@count}\n"