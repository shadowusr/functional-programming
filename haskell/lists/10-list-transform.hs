data MyListItem a = Elem a | MyList [MyListItem a] deriving Show

transform :: [a] -> [MyListItem a]
transform [x] = [Elem x]
transform (x:xs) = [Elem x, MyList (transform xs)]

transformBack :: [MyListItem a] -> [a]
transformBack [Elem x] = [x]
transformBack [Elem x, MyList list] = x : transformBack list
