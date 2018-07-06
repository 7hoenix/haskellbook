module Exercises8 where

cattyConny :: String -> String -> String 
cattyConny x y = x ++ " mrow " ++ y
    -- fill in the types
flippy = flip cattyConny
appedCatty = cattyConny "woops"
frappe = flippy "haha"

summer :: (Eq a, Num a) => a -> a
summer x = go x 1
    where go asdf count
            | asdf == 1 = count
            | otherwise = go (asdf - 1) (asdf + count)