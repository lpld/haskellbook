module Cipher(cipher, decipher) where

import Data.Char

cipher :: String -> String
cipher = shiftStr 3

decipher :: String -> String
decipher = shiftStr (-3)

shiftStr :: Int -> String -> String
shiftStr steps = map $ chr . (+ steps) . ord

