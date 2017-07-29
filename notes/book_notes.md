[TOC]

# Chapter 3. Strings

## Functions on strings

```haskell
-- Write a string to std out
putStr :: String -> IO ()

-- Write a string to std out, add a newline character
putStrLn :: String -> IO ()
```

# Chapter 4. Basic datatypes

## Defining a datatype

```haskell
data Bool = False | True
--   [1]     [2] [3]
```

1. Type constructor
2. Data constructor
3. `|` defines a sum type

## Numeric types

### Integral numbers
1. `Int`: fixed-precision integer.
2. `Integer`: ubounded integer.

### Fractional
1. `Float`
2. `Double`
3. `Rational`: ratio of two integers. For example, `1 / 2 :: Rational`

## Tuples
These are datatypes that allow to carry multiple values within a single value. Size and types of tuple elements are determined by the type of the tuple. I.e., `(a, b)` is a pair of values of types `a` and `b`, `(a, b, c)` is a triple, etc.

```haskell
data (,) a b = (,) a b -- this is the definition of pair

-- Exmaples of creating tuples:
(,) 8 9
(7, "Abc")
```
### Functions on tuples
```haskell
-- Functions to get first and second value of a pair:
fst :: (a, b) -> a
snd :: (a, b) -> b

-- Swap values of a pair:
swap :: (a, b) -> (b, a)
```

## Lists
Lists also contain multiple values within a single value. All elements are of the same type. The number of elements is not fixed by the type.

```haskell
l :: [Int]    -- a list of Ints
l = [1, 2, 3] -- a list with three elements
```

### Functions on lists
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

Chapter 5. Types
================

## Function type
The arrow, `(->)`, is a type constructor for functions. It has not data constructors. Fuctions are values.

```haskell
data (->) a b
```

## Currying and partial application
All functions in Haskell take one argument and return one result. Currying refers to nesting multiple functions, each accepting one argument and returning one result.

```haskell
f :: a -> a -> a

-- (->) is right associative, so this is equivalent to
f :: a -> (a -> a)
```
Thus, functions with more than one argument can be partially applied.

There are `curry` and `uncurry` functions. `curry` takes a function of one argument that takes a tuple (`(a, b) -> c`) and produces a function that takes two arguments sequentially (`a -> b -> c`). `uncurry` does the opposite.

```haskell
curry :: ((a, b) -> c) -> (a -> b -> c)
uncurry :: (a -> b -> c) -> ((a, b) -> c)
```

### Sectioning
Sectioning is a partial application of infix operators.

```haskell
(6/) -- (/) operator partially applied to value 6 as first argument.
(/6) -- same, but 6 now is second argument

(6/) 3 == 2   -- True
(/6) 18 == 18 -- True
```

Chapter 6. Typeclasses
======================
_todo: defining typeclasses and instaces_

## Eq
Typeclass that allows to test two values for equality.

```haskell
class Eq a where 
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
```

## Num
Typeclass implemented by most numeric types.

```haskell
class Num a where
    (+) :: a -> a -> a
    (*) :: a -> a -> a
    (-) :: a -> a -> a
    negate :: a -> a
    abs :: a -> a
    signum :: a -> a
    fromInteger :: Integer -> a

instance Num Integer
instance Num Int
instance Num Float
instance Num Double
```
Known instances: Integer, Int, Float, Double

## Integral
```haskell
class (Real a, Enum a) => Integral a where
   quot :: a -> a -> a
   rem :: a -> a -> a
   div :: a -> a -> a
   mod :: a -> a -> a
   quotRem :: a -> a -> (a, a)
   divMod :: a -> a -> (a, a)
   toInteger :: a -> Integer

instance Integral Int
instance Integral Integer
```

## Fractional
```haskell
class (Num a) => Fractional a where
   (/) :: a -> a -> a
   recip :: a -> a
   fromRational :: Rational -> a
```

## Ord
Type class for all types that has order defined.

```haskell
class Eq a => Ord a where
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a

data Ordering = LT | EQ | GT

instance Ord a => Ord (Maybe a)
instance (Ord a, Ord b) => Ord (Either a b)
instance Ord Integer
instance Ord a => Ord [a]
instance Ord Ordering
instance Ord Int
instance Ord Float
instance Ord Double
instance Ord Char
instance Ord Bool
```

## Enum
Typeclass for enumerable types, i.e. for each value there are known successor and predecessor.

```haskell
class Enum a where
    succ :: a -> a
    pred :: a -> a
    toEnum :: Int -> a -- take a value by its ordinal number
    fromEnum :: a -> Int -- get the ordinal number of a value
    enumFrom :: a -> [a] -- a list of values, starting from certain value
    enumFromThen :: a -> a -> [a] -- a list of values, starting from a certain value, followed by another value. for instance `enumFromThen 1 3` will give [1, 3, 5, ...]
    enumFromTo :: a -> a -> [a]
    enumFromThenTo :: a -> a -> a -> [a]
```

## Show
```haskell
class Show a where
    showsPrec :: Int -> a -> ShowS
    show :: a -> String
    showList :: [a] -> ShowS

instance Show a => Show [a]
instance Show Ordering
instance Show a => Show (Maybe a)
instance Show Integer
instance Show Int
instance Show Char
instance Show Bool
instance Show ()
instance Show Float
instance Show Double
```

## Type defaulting typeclasses
```haskell
default Num Integer
default Real Integer
default Enum Integer
default Integral Integer
default Fractional Double
default RealFrac Double
default Floating Double
default RealFloat Double
```

## Typeclasses deriving

```haskell
data Mood = Blah deriving (Eq, Show)
```

**Typeclasses that support deriving:**

Eq, Ord, Enum, Bounded, Read, Show

# Chapter 7. More functional patterns

## Anonymous functions

```haskell
-- definition
(\x -> x * 3) :: Integer -> Integer

-- application (function applied to value 5)
(\x -> x * 3) 5
```





