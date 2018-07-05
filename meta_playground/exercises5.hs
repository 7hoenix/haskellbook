{-# LANGUAGE NoMonomorphismRestriction #-}

module TypesExercises where

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

-- Type arguments
-- 2. Int
-- 3. Integer WRONG it is: Num b => b ?? weird.
-- 4. Double
-- 5. [Char]
-- 6. Eq b => b -> [Char]
-- 7. WRONG... we know its a number now and we already knew it was Ord. But still not that it is an integer
-- 8. (Num a, Ord a) => a
--
-- Parametricity on page 214 is confusing to me.

-- f :: Num a => a -> a -> a
f x y = x + y + 3

-- (++) :: [a] -> [a] -> [a]

myConcat x = x ++ " yo"


example = 1


-- chapter exercises: determine the type
-- 1. 
-- a.  (* 9) 6 num
-- b. [head [(0,"doge"),(1,"kitteh")]
-- Num a => (a, [Char])
-- c. Int a => (a, [Char])
-- Actual (Integer, [Char])
-- d.  False
-- Bool
-- e. length [1, 2, 3, 4, 5]
-- Int
--
-- 2. num
--
functionH :: [x] -> x
functionH (x:_) = x

-- functionC :: x -> y -> Bool
-- functionC x y =
--   if (x > y) then True else False


functionS :: (x, y) -> y
functionS (x, y) = y

i :: a -> a
i a = a

c :: a -> b -> a
c a b = a

r :: [a] -> [a]
r something = take 3 something

co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a =
  bToC (aToB a)


