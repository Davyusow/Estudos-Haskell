module Main (main) where

tamanhoPar :: String -> Bool
tamanhoPar x = even (length x)

inverteTexto :: String -> [Char]
inverteTexto x = reverse x

tamanhoStringsImpares :: [String] -> [Int]
tamanhoStringsImpares xs = [length x | x <- xs, odd (length x)]

cabeca :: [Int] -> Int
cabeca x = (last . reverse) x

palindromo :: String -> Bool
palindromo x = x == reverse x

multiTupla :: Int -> (Int, Int, Int, Int)
multiTupla x = (2 * x, 3 * x, 4 * x, 5 * x)

main :: IO ()
main = do
  putStrLn "hello world"
