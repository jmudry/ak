# Zadanie 14. Opisz jak można wyznaczyć wystąpienia wzorca P w tekście T za pomocą funkcji π dla
# konkatenacji PT słów P i T. Termin 8.01 – 2 pkt

pattern = "ababca"
text = "bbababcacbababbbcaababca"

m = pattern.length

def compute_pi p
  m = p.length
  pi = [0]*m
  k = 0
  for q in 2..m do
    while k > 0 and p[k+1] != p[q]
      k = pi[k]
    end
    if p[k+1] == p[q]
      k +=1
    end

    pi[q]=k
  end

  p pi
end

pi = compute_pi ([nil] + (pattern + text).split('') )

for i in m..((pattern+text).length) do
  if pi[i] == m
    p "Wzorzec występuje z przesunięciem #{i - 2*m}"
  end
end

# Opis
# Po wyliczeniu pi na słowie PT wyszukujemy w tablicy wystąpienia wartości m (gdzie m = |P|)
# Przesunięcie wystąpienia wzorca to wszystkie i - 2*m takie że pi[i] == m



