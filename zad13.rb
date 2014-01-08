# Zadanie 13. Załóżmy, że wszystkie symbole we wzorcu P są parami różne. Pokaż jak przyśpieszyć (czyli
# prosto zmodyfikować) algorytm naiwny wyszukiwania wzorca w tekście by działał on w
# czasie O(n) dla n-symbolowego tekstu T. Termin 8.01 – 2pkt

wzorzec = "kot"
text = "kotkotaaaaalakota"

m = wzorzec.length
n = text.length

s = 0
count = 0

while s < (n-m) do
  check = true
  for i in 0..(m-1)
    count +=1
    if wzorzec[i] != text[s+i]
      check = false
      s += i == 0 ? 1 : i
      break
    end
  end

  if check
    p "wzorzez występuje z przesunięciem #{s}"
    s+=m
  end
end


p "Liczba operacji #{count} dla n = #{n}"
