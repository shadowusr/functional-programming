contains :: Eq a => a -> [a] -> Bool 
contains x [] = False
contains x (y:ys)
    | x == y = True
    | otherwise = contains x ys

isSubset :: Eq a => [a] -> [a] -> Bool
isSubset [x] ys = contains x ys
isSubset (x:xs) ys = contains x ys && isSubset xs ys

isProperSubset :: Eq a => [a] -> [a] -> Bool
isProperSubset xs ys = xs /= [] && xs /= ys && isSubset xs ys
