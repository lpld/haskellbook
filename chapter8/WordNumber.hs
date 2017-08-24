module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = undefined

digits :: Int -> [Int]
digits = getDigits []
        where getDigits res n
                | n == 0    = res
                | otherwise = 
                      let (d, m) = n `divMod` 10
                       in getDigits (m:res) d

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . map digitToWord . digits
