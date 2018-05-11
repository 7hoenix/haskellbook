module StringExercises where

exclamate :: String -> String
exclamate value =
  (++) value ['!']

fifthLetter :: String -> Char
fifthLetter value =
  (!!) value 4

dropFirstNine :: String -> String
dropFirstNine value =
  drop 9 value

thirdLetter :: String -> Char
thirdLetter value =
  (!!) value 3

getterThing :: String -> Int -> Char
getterThing value index =
  (!!) value index


-- 5

rvrs :: String -> String
rvrs value =
  drop 9 value ++ take 4 (drop 5 value) ++ take 5 value

main :: IO ()
main = print (rvrs "Curry is awesome")
