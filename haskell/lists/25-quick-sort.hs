quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = lessPart ++ [x] ++ greaterPart
    where
        lessPart = quickSort [a | a <- xs, a <= x]
        greaterPart = quickSort [a | a <- xs, a > x]
