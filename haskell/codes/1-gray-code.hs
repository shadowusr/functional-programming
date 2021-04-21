import Data.Bits
import Text.Printf

grayCode :: Int -> [Int]
grayCode 0 = [0]
grayCode n = prevCode ++ map (`setBit` (n - 1)) (reverse prevCode)
    where prevCode = grayCode (n - 1)

printBinary :: PrintfArg a => [a] -> IO ()
printBinary list = sequence_ (map (\x -> putStrLn (printf "%010b" x)) list)

main =
    print "========= TASK 1 ========="
        >> printBinary (grayCode 3)


