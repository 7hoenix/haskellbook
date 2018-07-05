{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module Exercises11 where

import Data.Int
import Data.List

data Price 
    = Price Integer
    deriving (Eq, Show)

data Manufacturer 
    = Mini
    | Mazda
    | Tata deriving (Eq, Show)

data Airline 
    = PapuAir
    | CatapultsR
    | TakeUnited deriving (Eq, Show)


data Vehicle = Car Manufacturer Price
    | Plane Airline
    deriving (Eq, Show)


myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

data Example = MakeExample Int deriving Show
data Examplesss = MakeExamplesss deriving Show


newtype Cows =
    Cows Int deriving (Eq, Show)



class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats =
    Goats Int deriving (Eq, Show, TooMany)

instance TooMany (Int, String) where
    tooMany (n, x) = n > 5

instance TooMany (Int, Int) where
    tooMany (n, m) = n + m > 43

-- todo: solve this one.
-- instance TooMany (Num a, TooMany a) where
--     tooMany (x, y) = x + tooMany y > 43

data BigSmall =
    Big Bool
    | Small Bool deriving (Eq, Show)

-- Big Bool - 2
-- Small Bool - 2
-- Total 2 * 2 = 4

data NumberOrBool =
    Numba Int8
    | BoolyBool Bool deriving (Eq, Show)


-- data Person =
--     MkPerson String Int
--     deriving (Eq, Show)

data Person = 
    Person { name :: String
    , age :: Int
    } deriving (Eq, Show)

jm = Person "Juie" 108
ca = Person "chris" 16

namae :: Person -> String
namae (Person s _) = s

-- data Fiction = Fiction deriving Show
-- data Nonfiction = Nonfiction deriving Show
-- data BookType = FictionBook Fiction
--     | NonfictionBook Nonfiction
--     deriving Show

type AuthorName = String

-- data Author = Author (AuthorName, BookType)

data Author =
    Fiction AuthorName
    | Nonfiction AuthorName
    deriving (Eq, Show)

data Expr =
    Number Int
    | Add Expr Expr
    | Minus Expr
    | Mult Expr Expr
    | Divide Expr Expr

-- type Number = Int
-- type Add = (Expr, Expr)
-- type Minus = Expr
-- type Mult = (Expr, Expr)
-- type Divide = (Expr, Expr)

-- type Expr =
--     Either Number
--     (Either Add
--     (Either Minus
--     (Either Mult Divide)))

data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show

type Gardener = String

data Garden =
    Garden Gardener FlowerType deriving Show

data GuessWhat =
    Chickenbutt deriving (Eq, Show)

data Id a =
    MkId a deriving (Eq, Show)

data Product a b =
    Product a b deriving (Eq, Show)

data Sum a b =
    First a
    | Second b deriving (Eq, Show)

data RecordProduct a b =
    RecordProduct { pfirst :: a
                    , psecond :: b } deriving (Eq, Show)

newtype NumCow =
    NumCow Int deriving (Eq, Show)

newtype NumPig = NumPig Int deriving (Eq, Show)

data Farmhouse = Farmhouse NumCow NumPig deriving (Eq, Show)

type Farmhouse' = Product NumCow NumPig

newtype NumSheep = NumSheep Int deriving (Eq, Show)

data BigFarmhouse = BigFarmhouse NumCow NumPig NumSheep deriving (Eq, Show)

type BigFarmhouse' = Product NumCow (Product NumPig NumSheep)

type Name = String
type Age = Int
type LovesMud = Bool

type PoundsOfWool = Int

data CowInfo = CowInfo Name Age deriving (Eq, Show)
data PigInfo = PigInfo Name Age LovesMud deriving (Eq, Show)
data SheepInfo = SheepInfo Name Age PoundsOfWool deriving (Eq, Show)

data Animal = 
    Sheep SheepInfo 
    | Pig PigInfo
    | Cow CowInfo
     deriving (Eq, Show)

type Animal' = Sum CowInfo (Sum PigInfo SheepInfo)

idInt :: Id Integer
idInt = MkId 10

type Awesome = Bool

person :: Product Name Awesome
person = Product "Simon" True


data SocialNetwork =
    Twitter
    | AskFm deriving (Eq, Show)

-- myRecord :: RecordProduct Integer Float
-- myRecord = RecordProduct 42 0.0001

-- myRecord :: RecordProduct Integer Float
-- myRecord = RecordProduct { pfirst = 42, psecond = 0.0001 }

data OperatingSystem =
    Gnu
    | OpenBSD
    | Mac
    | Windows 
    deriving (Eq, Show)

data ProgLang =
    Haskell
    | Agda
    | Idris
    | PureScript
    deriving (Eq, Show)

data Programmer =
    Programmer { os :: OperatingSystem
                 , lang :: ProgLang }
                 deriving (Eq, Show)

nineToFive :: Programmer
nineToFive = Programmer { os = Mac, lang = Haskell }

feelingWizardly :: Programmer
feelingWizardly =
    Programmer { lang = Agda
                , os = Gnu }

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ Gnu
    , OpenBSD
    , Mac
    , Windows 
    ]

allLanguages :: [ProgLang]
allLanguages =
    [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = 
    foldr (\os final -> final ++ foldr (\language result -> result ++ [Programmer os language]) [] allLanguages) [] allOperatingSystems

data ThereYet =
    There Float Int Bool
    deriving (Eq, Show)

notYet :: Int -> Bool -> ThereYet
notYet = There 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet 10

yusssss :: ThereYet
yusssss = notQuite False


-- newtype Name = Name String deriving Show
-- newtype Acres = Acres Int deriving Show

-- data FarmerType = 
--     DairyFarmer
--     | WhatFarmer
--     | SoybeanFarmer 
--     deriving Show

-- data Farmer =
--     Farmer Name Acres FarmerType
--     deriving Show

-- isDairyFarmer :: Farmer -> Bool
-- isDairyFarmer (Farmer _ _ DairyFarmer) =
--     True

-- isDairyFarmer _ =
--     False

-- data FarmerRec =
--     FarmerRec { name :: Name
--               , acres :: Acres
--               , farmerType :: FarmerType
--     }
--     deriving Show

-- isDairyFarmerRec :: FarmerRec -> Bool
-- isDairyFarmerRec farmer =
--     case farmerType farmer of 
--         DairyFarmer -> True
--         _ -> False

data Quantum =
    Yes
    | No 
    | Both
    deriving (Eq, Show)

-- todo: ask about this?
convert :: Quantum -> Bool
convert Yes = True
convert No = False
convert Both = True

-- 1.
data Quad =
    One
    | Two
    | Three 
    | Four
    deriving (Eq, Show)

eQuad :: Either Quad Quad
eQuad = undefined
-- 8

prodQuad :: (Quad, Quad)
prodQuad = undefined
-- 16

funcQuad :: Quad -> Quad
funcQuad = undefined
-- 4^4 -> 256

prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined
-- 2 * 2 * 2 -> 8

gTwo :: Bool -> Bool -> Bool
gTwo = undefined
-- 2 ^ 2 ^ 2 -> 2 ^ 4 -> 16

fTwo :: Bool -> Quad -> Quad
fTwo = undefined
-- 2 ^ 4 ^ 4 -> 2 ^ 16 -> 65536


data BinaryTree a =
    Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
    | b == a = Node left a right
    | b < a = Node (insert' b left) a right
    | b > a = Node left a (insert' b right)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
    Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' =
    Node (Node Leaf 3 Leaf)
        1
        (Node Leaf 4 Leaf)

mapExpected =
    Node (Node Leaf 4 Leaf)
        2
        (Node Leaf 5 Leaf)
    
mapOkay =
    if mapTree (+1) testTree' == mapExpected
    then print "yup okay"
    else error "test failed"


preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) =
    [a] ++ preorder left ++ preorder right


inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) =
    inorder left ++ [a] ++ inorder right

testTree :: BinaryTree Integer
testTree =
    Node (Node Leaf 1 Leaf)
        2
        (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
    if preorder testTree == [2, 1, 3]
    then putStrLn "working"
    else putStrLn "not working"

testInorder :: IO ()
testInorder =
    if inorder testTree == [1, 2, 3]
    then putStrLn "working"
    else putStrLn "not working"

-- todo: understand this
-- foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
-- foldTree _ result Leaf = result
-- foldTree f result (Node left a right) =
--     foldr f [foldTree f result left,  f a result, foldTree f result right]

