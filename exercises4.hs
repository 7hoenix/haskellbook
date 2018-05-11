-- 1) Mood
-- 2) Blah or Woot
-- 3) 

data Mood = Blah | Woot deriving Show

-- 4)
changeMood :: Mood -> Mood
changeMood Woot = Blah
changeMood Blah = Woot

fst' :: (a, b) -> a
fst' (a, b) = a

-- chapter exercises
-- 1)
-- length' :: [a] -> Integer

-- 2)
-- a) 5
-- b) 3
-- c) 2
-- d) 5

-- 3) One is an Int? 我不知道
--  4) (div) 6 (length [1, 2, 3])
--  5) Bool
--  6) True
--  7) 
--  a) True
--  b) Won't work because lists have to be the same type
--  c) 5
--  d) False
--  e) Won't work since 9 is a num and not a Bool
--
-- 8)
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x =
  x == reverse x

-- 9)
myAbs :: Integer -> Integer
myAbs num =
  if num >= 0 then num else num * (negate 1)

-- 10)
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f tup1 tup2 =
  ((,) ((,) (snd tup1) (snd tup2)) ((,) (fst tup1) (fst tup2)))


x = (+)

g xs = (x) w 1
      where w = length xs

idea x = x


h (a, b) = a


-- match types
--
-- 1) a
-- 2) b
-- 3) a
-- 4) d
--
--
-- I don't understand the fat arrow...
