data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Eq, Show)
isSubtree :: Eq a => Tree a -> Tree a -> Bool
isSubtree sub tree
    | sub == tree = True
isSubtree sub (Node value left right) = isSubtree sub left || isSubtree sub right
isSubtree _ _ = False

tree = Node 1 (Node 2 Leaf Leaf) (Node 3 (Node 4 Leaf Leaf) (Node 5 Leaf Leaf))
sub = Node 3 (Node 4 Leaf Leaf) (Node 5 Leaf Leaf)
notsub = Node 3 Leaf (Node 6 Leaf Leaf)

main =
    print "========= TASK 4 ========="
        >> print (isSubtree sub tree)
        >> print (isSubtree notsub tree)
