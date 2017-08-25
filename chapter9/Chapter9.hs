module Chapter9 where

-- write your own `enumFromTo` definitions for the types provided.
-- actually, we can write one for all
etf :: (Enum a, Ord a) => a -> a -> [a]
etf from to
    | from > to  = []
    | from == to = [from]
    | otherwise  = from : (etf (succ from) to)

-- Using `takeWhile` and `dropWhile`, write a function that takes a string and returns a list of strings, using spaces to separate the elements of the string into words.

splitString :: Char -> String -> [String]
splitString _ "" = []
splitString sep s =
        let word = takeWhile (/=sep) s
            rest = dropWhile (/=sep) s
         in word:(splitString sep . drop 1 $ rest)

splitWords :: String -> [String]
splitWords = splitString ' '

splitLines :: String -> [String]
splitLines = splitString '\n'


