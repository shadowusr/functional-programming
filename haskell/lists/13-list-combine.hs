combine :: [a] -> [a] -> [a]
combine [] [] = []
combine xs [] = xs
combine [] xs = xs
combine (x:xs) (y:ys) = x:y:combine xs ys
