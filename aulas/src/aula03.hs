
data Dia = SEGUNDA | TERCA | QUARTA | QUINTA | SEXTA | SABADO | DOMINGO

agenda :: Dia -> String
agenda DOMINGO = "Tv..."
agenda SABADO = "Festa"
agenda _ = "Trabalho"

f :: (Int, Int) -> Int
f (0, 0) = 0
f (0, 1) = 1
f (1, 0) = 1
f (x, 0) = x
f (0, y) = y
f (x, y) = x + y

g :: (Int, Int) -> Int
g (7,7) = 7
g (_,_) = 0

h :: [Int] -> Int
h [] = 0
h (_:[]) = 1
h (_:x:[]) = 2 + x
h (x:y:z:[]) = 3*x*y*z
h (x:_:_:w:[]) = 4+x+w
h (x:xs) = x

data Pessoa = Fisica String Int | Juridica String

teste :: Pessoa -> (String, String)
teste (Fisica x y) = ("Nome: " ++ x, "Idade:" ++ show y)
teste (Juridica x) = ("Nome: " ++ x, "Não há idade")

newtype Dado = Dado Int -- Semelhante ao typedef em 'C', podendo dar apelidos para um tipo

--data Ponto = Ponto Double Double
data Ponto = Ponto {xval,yval :: Double}



main :: IO ()
main = do
  putStrLn "adsad"
