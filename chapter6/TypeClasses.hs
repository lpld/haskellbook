module TypeClasses where

-- I. Write the `Eq` instance for the datatype provided.

-- 1.
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
        TisAn x == TisAn y = x == y

-- 2.
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
        Two x1 y1 == Two x2 y2 = x1 == x2 && y1 == y2

-- 3.
data StringOrInt = TisAnInt   Int
                 | TisASrting String

instance Eq StringOrInt where
        TisAnInt x == TisAnInt y = x == y
        TisASrting s == TisASrting t = s == t
        _ == _ = False

-- 4.
data Pair a = Pair a a
instance Eq a => Eq (Pair a) where
        Pair a1 b1 == Pair a2 b2 = a1 == a2 && b1 == b2

-- 5.
data Tuple a b = Tuple a b
instance (Eq a, Eq b) => Eq (Tuple a b) where
        Tuple a1 b1 == Tuple a2 b2 = a1 == a2 && b1 == b2

-- 6.
data Which a = ThisOne a
             | ThatOne a

instance Eq a => Eq (Which a) where
        ThisOne a == ThisOne b = a == b
        ThatOne a == ThatOne b = a == b
        _ == _ = False

-- 7.
data EitherOr a b = Hello a
                  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
        Hello a == Hello b = a == b
        Goodbye a == Goodbye b = a == b
        _ == _ = False
