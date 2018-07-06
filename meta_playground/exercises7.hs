module Exercises7 where

-- 1. All of them are the same.
-- 2. 
--

-- addOne = \x -> x + 1

-- addOneIfOdd n = case odd n of
--                   True -> f n
--                   False -> n
--                   where f = \n -> n + 1

-- mflip f = \x -> \y -> f y x

-- mnormal f x y = f y x

-- isItTwo :: Integer -> Bool

-- isItTwo 2 = True
-- isItTwo _ = False

newtype Username =
  Username String

newtype AccountNumber =
  AccountNumber Integer

data User =
  UnregisteredUser
    | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser =
  putStrLn "UnregistereredUser"

printUser (RegisteredUser (Username name) (AccountNumber accountNumber)) =
  putStrLn $ name ++ " " ++ show accountNumber

data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica deriving (Eq, Show)


data Penguin =
  Peng WherePenguinsLive
  deriving (Eq, Show)


isSouthAfrica' :: WherePenguinsLive -> Bool
isSouthAfrica' SouthAfrica = True
isSouthAfrica' _           = False

gimmeWhereTheyLive :: Penguin
                   -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) = whereitlives

humboldt = Peng SouthAmerica
gentoo = Peng Antarctica
macaroni = Peng Antarctica
little = Peng Australia
galapagos = Peng Galapagos



galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _ = False

antarcticPenguin :: Penguin -> Bool
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _ = False

antarcticOrGalapagos p =
  (galapagosPenguin p)
  || (antarcticPenguin p)




-- addEmUp2 :: Num a => (a, a) -> a
-- addEmUp2 (x, y) = x + y






k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))



returnLast :: a -> b -> c -> d -> d
returnLast _ _ _ d = d


returnAfterApply :: (a -> b) -> a -> c -> b
returnAfterApply f a c = f a

data Employee = Coder | Manager | Veep | CEO deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
  putStrLn $ show e ++
            " is the boss of " ++
            show e'




codersRuleCEOsDrool :: Employee -> Employee -> Ordering
codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _ = GT
codersRuleCEOsDrool _ Coder = LT
codersRuleCEOsDrool e e' =
  compare e e'


employeeRank :: (Employee -> Employee -> Ordering) -> Employee -> Employee -> IO ()
employeeRank f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither"
    LT -> (flip reportBoss) e e'


dodgy :: Integer -> Integer -> Integer
dodgy x y = x + y * 10

oneIsONe :: (Integer -> Integer)
oneIsONe = dodgy 1

oneIsTwo :: (Integer -> Integer)
oneIsTwo = (flip dodgy) 2


myAbs :: Integer -> Integer
myAbs x
    | x < 0 = (-x)
    | otherwise = x


bloodNa :: Integer -> String
bloodNa x
    | x < 135 = "too low"
    | x > 145 = "too high"
    | otherwise = "just right"



avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x 
  |y>=0.8 ='B' 
  |y>=0.9 ='A' 
  |y>=0.7 ='C' 
  | y >= 0.59 = 'D' 
  |y< 0.59='F' where y = x / 100



add :: Int -> Int -> Int
add x y = x + y
addPF :: Int -> Int -> Int
addPF = (+)
addOne :: Int -> Int
addOne = \x -> x + 1
addOnePF :: Int -> Int 
addOnePF = (+1)


foo :: Char -> String
foo = undefined

bar :: String -> [String]
bar = undefined


foz :: a -> a
foz x = x




foldBool :: a -> a -> Bool -> a
foldBool =
  error
  "Error"

roundTrip :: (Show a, Read b) => a -> b 
-- roundTrip a = read (show a)
roundTrip = read . show

main = do
  print (roundTrip 4) 
  print (id 4)