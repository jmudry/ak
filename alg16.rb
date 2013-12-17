# Algorytm 16 z wykładu
@text = "ababbaaabbb"
@pattern = "bb"

T = [nil] + @text.split("")
P = [nil] + @pattern.split("")

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def green(text); colorize(text, 32); end

# Drukowanie wyniku
def print_text green
  p "Wzorzec występuje z przesunieciem: #{green}"
  r_text = ''
  i = 1
  while i <= T.length-1
    if i == green+1
      r_text+= green(T.slice(i,@pattern.length).join(""))
      i += @pattern.length
    else
      r_text += T[i]
      i +=1
    end
  end
  puts r_text
end

def compute_prefix p
  m = p.length-1
  pi = []
  pi[1] = 0
  k = 0
  for q in 2..m do
    while k > 0 && p[k+1] != p[q]
      k = pi[k]
    end
    k +=1 if p[k+1] == p[q]
    pi[q] = k
  end
  pi
end

def kmp_matcher t, p
  n = t.length-1
  m = p.length-1
  pi = compute_prefix p
  q = 0
  for i in 1..n do
    while q > 0 and p[q+1] != t[i]
      q = pi[q]
    end
    q +=1 if p[q+1] == t[i]

    if q == m
      print_text i-m
      q = pi[q]
    end
  end
end

kmp_matcher T, P