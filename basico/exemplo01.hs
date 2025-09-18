-- comentários
polinomio :: Int -> Int
polinomio x = x*x + 10*x + 2

main :: IO ()
main = do
  print (polinomio 5)