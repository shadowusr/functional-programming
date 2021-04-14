contains :: Eq a => a -> [a] -> Bool 
contains x [] = False
contains x (y:ys)
    | x == y = True
    | otherwise = contains x ys

firstMatching :: (Eq a, Ord a) => [a] -> [a] -> a
firstMatching (x:xs) ys
    | contains x ys = x
    | otherwise = firstMatching xs ys
