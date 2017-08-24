module Recursion where

-- 2. Write a function that recursively sums all numbers from 1 to n.
sumTo :: (Eq a, Num a) => a -> a
sumTo num = doSum 0 num
        where doSum res n 
                 | n == 0    = res
                 | otherwise = doSum (res + n) (n - 1)

-- 3. Write a function that multiplies two integral numbers using recurive summation.
mult :: (Integral a) => a -> a -> a
mult a b = doMult 0 a b
        where doMult res x y
                 | y == 0    = res
                 | otherwise = doMult (res + x) x (y - 1)

-- McCarthy 91 function
mc91 :: (Num a, Ord a) => a -> a
mc91 n
  | n > 100   = n - 10
  | otherwise = mc91 . mc91 . (+11) $ n
