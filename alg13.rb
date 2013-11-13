s = []
r = []
n = 7

s[1] = n
r[1] = 1
d = 1

def wypisz array, r, d
  tab = []
  added = []
  for i in 1..d
    if !added.include? array[i]
      r[i].times{tab << array[i]} if !r[i].nil?
      added << array[i]
    end
  end
  p tab.compact.join('+')
  sum = 0
  tab.each{|x| sum += x}
end

wypisz s, r, d

while s[1] > 1
  sum = 0
  if s[d] == 1
    sum = sum + r[d]
    d = d - 1
  end
  sum = sum + s[d]
  r[d] = r[d] - 1
  l = s[d] - 1
  d = d + 1 if r[d] > 0
  s[d] = l
  r[d] = sum / l
  l = sum % l
  if l != 0
    d = d+1
    s[d]=l
    r[d] = 1
  end
  wypisz s, r, d

end