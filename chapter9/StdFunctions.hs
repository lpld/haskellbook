module StdFunctions where

myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || (myOr xs)

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = myOr . map f

myElem :: Eq a => a -> [a] -> Bool
myElem = myAny . (==)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- flatten
squish :: [[a]] -> [a]
squish []     = []
squish (x:xs) = x ++ (squish xs)

-- flatMap
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ (squishMap f xs)

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

optimumBy :: (a -> a -> a) -> [a] -> a
optimumBy _ [] = error "Empty list"
optimumBy best (x:xs) = findBest x xs
        where findBest b [] = b
              findBest b (a:as) = findBest (best a b) as

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f = optimumBy $ selectWhen GT f

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f = optimumBy $ selectWhen LT f

selectWhen :: Ordering -> (a -> a -> Ordering) -> a -> a -> a
selectWhen o f a b = if f a b == o then a else b

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
