_last :: [a] -> a
_last [x] = x
_last (x:xs) = _last xs

_last2 :: [a] -> a
_last2 = foldr1 (\ a b -> b)
