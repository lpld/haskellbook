module StdFunctions2 where

-- rewrite std functions using folds

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny p = myOr . map p

myElem_viaFold :: (Eq a) => a -> [a] -> Bool
myElem_viaFold e = foldr ((||) . (== e)) False

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr filterElem []
        where filterElem e acc
                | p e       = e:acc
                | otherwise = acc

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy = myOptimumBy GT

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy = myOptimumBy LT

myOptimumBy :: Ordering -> (a -> a -> Ordering) -> [a] -> a
myOptimumBy _ _ [] = error "Empty list"
myOptimumBy c comp (x:xs) = foldr getBest x xs
        where getBest a b
                | comp a b == c = a
                | otherwise     = b

