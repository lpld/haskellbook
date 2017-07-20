Chapter 4. Basic datatypes
====================

#### Define a datatype
```haskell
data Bool = False | True
--   [1]     [2] [3]
```
1. Type constructor
2. Data constructor
3. `|` defines a sum type

#### Numeric types
##### Integral numbers
1. `Int`: fixed-precision integer.
2. `Integer`: ubounded integer.

##### Fractional
1. `Float`
2. `Double`
3. `Rational`: ratio of two integers. For example, `1 / 2 :: Rational`

#### Tuples
These are datatypes that allow to carry multiple values within a single value. Size and types of tuple elements are determined by the type of the tuple. I.e., `(a, b)` is a pair of values of types `a` and `b`, `(a, b, c)` is a triple, etc.
```haskell
data (,) a b = (,) a b -- this is the definition of pair

-- Exmaples of creating tuples:
(,) 8 9
(7, "Abc")
```
##### Functions on tuples
```haskell
-- Functions to get first and second value of a pair:
fst :: (a, b) -> a
snd :: (a, b) -> b

-- Swap values of a pair:
swap :: (a, b) -> (b, a)
```

#### Lists
Lists also contain multiple values within a single value. All elements are of the same type. The number of elements is not fixed by the type.
```haskell
l :: [Int]    -- a list of Ints
l = [1, 2, 3] -- a list with three elements
```

##### Functions on lists
```haskell
-- Concat two lists
(++) :: [a] -> [a] -> [a]

-- Concat a list of lists
concat :: [[a]] -> [a]

-- Length of a list
length :: [a] -> Int

-- Reverse a list
reverse :: [a] -> [a]
```
