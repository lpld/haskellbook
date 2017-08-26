module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Show)

theDatabase :: [DatabaseItem]
theDatabase =
   [
     DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
   , DbNumber 9001
   , DbString "Hello, world!"
   , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
   ]

-- 1. Write a function that filters for DbDate and returns a list of UTC time values inside them:
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = filterDatabase extractDate

-- 2. Write a function that filters DbNumbers:
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = filterDatabase extractNumber

-- 3. Write a function that gets a most recent date
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4. Write a function that sums all DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- 5. Write a function that get the average of the DbNumber values:
avgDb :: [DatabaseItem] -> Double
avgDb db = let s = sumDb db
               n = length (filterDbNumber db)
            in (fromIntegral s) / (fromIntegral n)

extractDate :: DatabaseItem -> Maybe UTCTime
extractDate (DbDate value) = Just value
extractDate _ = Nothing

extractNumber :: DatabaseItem -> Maybe Integer
extractNumber (DbNumber value) = Just value
extractNumber _ = Nothing

filterDatabase :: (DatabaseItem -> Maybe a) -> [DatabaseItem] -> [a]
filterDatabase extract = foldr doExtract []
        where doExtract item vs =
                case extract item of
                  Just v -> v:vs
                  _ -> vs
