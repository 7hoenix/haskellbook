sayHello :: String -> IO ()
sayHello x =
  putStrLn ("Hello, " ++ x ++ "!")

triple :: Integer -> Integer
triple num =
  num * 3

multiply :: Integer -> Integer -> Integer
multiply num1 num2 =
  num1 * num2
