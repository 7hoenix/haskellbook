module ArithBroken where

-- main :: IO ()
-- main = do
--   print (1 + 2)
--   print 10
--   print (negate 1)
--   print ((+) 0 blah)
--     where blah = negate 1
--
-- data Woot

-- data Blah

-- f :: Woot -> Blah
-- f = undefined

-- g :: (Blah, Woot) -> (Blah, Blah)
-- g (b, w) =  (b, f w)


-- f :: Int -> String
-- f = undefined

-- g :: String -> Char
-- g = undefined

-- h :: Int -> Char
-- h i = g (f i)
-- 
-- data A
-- data B
-- data C

-- q :: A -> B q = undefined

-- w :: B -> C
-- w = undefined

-- e :: A -> C
-- e a = w (q a)
--
--

-- data X
-- data Y
-- data Z

-- xz :: X -> Z
-- xz = undefined

-- yz :: Y -> Z
-- yz = undefined

-- xform (x, y) = (xz x, yz y)
-- xform :: (X, Y) -> (Z, Z)


munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w 
munge xy ywz x = fst (ywz (xy x))



-- blahFunc :: Num a => a -> String
-- blahFunc x =
-- 	if (x == 1) then "cake" else "pie"
