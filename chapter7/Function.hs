-- 1. Rewrite the function using `divMod`
--
tensDigit :: Integral a => a -> a
tensDigit x = d
        where xLast = x `div` 10
              d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' = snd . (`divMod` 10) . fst . (`divMod` 10)

-- Write function for hundreds digits
nthDigit :: Integral a => Int -> a -> a
nthDigit p = (`mod` 10) . (`div` 10^p)

hdrdDigit = nthDigit 2
tensDigit'' = nthDigit 1

-- 2. Implement the function of the type a -> a -> Bool -> a
-- once each using a case expression and once with a guard.
foldBool :: a -> a -> Bool -> a
foldBool x y exp = 
        case exp of
          True -> x
          False -> y

foldBool' x y exp
  | exp == True = x
  | otherwise   = y

-- 3. Fill in the definition
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)

