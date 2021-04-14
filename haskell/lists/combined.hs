-- data MyListItem a = Elem a | MyList [MyListItem a] deriving Show

-- item :: [MyListItem Int]
-- item = [Elem 1, MyList [Elem 1, Elem 2, Elem 3, Elem 4]]

-- transform :: [a] -> [MyListItem a]
-- transform [x] = [MyList [Elem x]]
-- transform (x:xs) = Elem x : transform xs

-- data MyListItem a = Elem a | MyList [MyListItem a]

-- [1, [2, [3, ...]]]
-- transform [x] = [x]
-- transform (x:xs) = [x, transform xs]

-- _foldr f acc [] = acc
-- _foldr f acc (x:xs) = f x (_foldr f acc xs)

-- main =
--     print (_last [1,2,3,4]) >>
--     -- print (_foldr (+) 0 [1,2,3,4,5]) >>
--     -- print (_last2 [1,2,3,4])
--     print (transform [1,2,3,4])

_last [x] = x
_last (x : xs) = _last xs

_last2 :: [a] -> a
_last2 = foldr1 (\a b -> b)

data MyListItem a = Elem a | MyList [MyListItem a] deriving (Show)

item :: [MyListItem Int]
item = [Elem 1, MyList [Elem 1, Elem 2, Elem 3, Elem 4]]

transform :: [a] -> [MyListItem a]
transform [x] = [Elem x]
transform (x : xs) = [Elem x, MyList (transform xs)]

transformBack :: [MyListItem a] -> [a]
transformBack [Elem x] = [x]
transformBack [Elem x, MyList list] = x : transformBack list

combine :: [a] -> [a] -> [a]
combine [] [] = []
combine xs [] = xs
combine [] xs = xs
combine (x : xs) (y : ys) = x : y : combine xs ys

contains :: Eq a => a -> [a] -> Bool
contains x [] = False
contains x (y : ys)
  | x == y = True
  | otherwise = contains x ys

firstMatching :: (Eq a, Ord a) => [a] -> [a] -> a
firstMatching (x : xs) ys
  | contains x ys = x
  | otherwise = firstMatching xs ys

{-- where
    contains x [] = False
    contains x (y:ys)
        | x == y = True
        | otherwise = contains x ys --}

-- firstMatching [1,2,3,4] [6,7,2,7]

isSubset :: Eq a => [a] -> [a] -> Bool
isSubset [x] ys = contains x ys
isSubset (x : xs) ys = contains x ys && isSubset xs ys

isProperSubset :: Eq a => [a] -> [a] -> Bool
isProperSubset xs ys = xs /= [] && xs /= ys && isSubset xs ys

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x : xs) = lessPart ++ [x] ++ greaterPart
  where
    lessPart = quickSort [a | a <- xs, a <= x]
    greaterPart = quickSort [a | a <- xs, a > x]

main =
  print "========= TASK 1 ========="
    >> print (_last [1, 2, 3, 4])
    >> print "========= TASK 10 ========="
    >> print (transform [1, 2, 3, 4])
    >> print (transformBack [Elem 1, MyList [Elem 2, MyList [Elem 3, MyList [Elem 4]]]])
    >> print "========= TASK 13 ========="
    >> print (combine [1, 2, 3, 4] [4, 3, 2, 1])
    >> print "========= TASK 15 ========="
    >> print (firstMatching [1, 2, 3] [9, 0, 4, 5, 2])
    >> print "========= TASK 19 ========="
    >> print (isSubset [1, 2] [5, 3, 5, 1, 2])
    >> print (isSubset [1, 9] [5, 3, 5, 1, 2])
    >> print (isProperSubset [1, 2] [5, 3, 5, 1, 2])
    >> print (isProperSubset [1, 2] [1, 2])
    >> print "========= TASK 25 ========="
    >> print (quickSort [1, 9, 0, 4, 2, 8, 7])