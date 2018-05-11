module Dates where
import Data.List (sort)

data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving (Ord, Show)

data Date =
  Date DayOfWeek Int


instance Eq DayOfWeek where
  (==) Mon Mon = True 
  (==) Tue Tue = True 
  (==) Weds Weds = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
      weekday == weekday'
      && dayOfMonth == dayOfMonth'


-- f :: Int -> Bool
-- f 2 = True

data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn i) (TisAn i') = i == i'

data TwoIntegers =
  Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two i j) (Two i' j') = i == i' && j == j'

data StringOrInt =
  TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt i) (TisAnInt i') = i == i'
  (==) (TisAString s) (TisAString s') = s == s'
  (==) _ _ = False

-- ??
-- data Pair a =
--   Pair' a a

-- instance Eq Pair where
--   (==) (Pair' x y) (Pair' x' y') = x == x' && y == y'

-- data Tuple a b =
--   Tuple a b

-- instance Eq Tuple where
--   (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'


-- exercises
-- c,

data Person =
  Person Bool
  deriving (Show)

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)


data Mood = Blah
          | Woot deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot
             then Blah
             else x

type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

-- s1 = Sentence "dogs" "drool"
-- s2 = Sentence "Julie" "loves" "dogs"


data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'

-- ii :: a
-- ii = 1

-- freud' :: Int -> Int
-- freud' x = x

-- myX = 1 :: Int

-- sigmund :: Num a => a -> a
-- sigmund x = myX


jung :: [Int] -> Int
jung xs = head (sort xs)

young :: Ord a => [a] -> a
young xs = head (sort xs)

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)


chk :: Eq b => (a -> b) -> a -> b -> Bool
chk ab a b = (ab a) == b

arith :: Num b => (a -> b) -> Integer -> a -> b
arith aToB _ a =
  aToB a
