import Data.Foldable
-- a number n is prime if n can't be divided by a for a in [2..sqrt(n)]
is_prime :: Integer -> Bool
is_prime n = n > 1 && all (\x -> (mod n x) /= 0) [2..(floor . sqrt . fromIntegral) n]

-- generates all primes between a and b
primes :: Integer -> Integer -> [Integer]
primes a b = [x | x <- [a..b], is_prime x]

prime_partitions :: Integer -> Integer -> [Integer] -> IO ()
prime_partitions 0 _ lst = putStrLn $ join " + " (map show lst)
prime_partitions n k lst =
						forM_ (primes (k+1) n) $ \p -> do 
						prime_partitions (n-p) p (lst++[p])
	
join :: String -> [String] -> String
join _ (a:[]) = a
join sep (a:b) = a ++ sep ++ join sep b

main = do
	putStrLn "Enter a number:"
	n <- getLine
	let num = read n :: Integer
	prime_partitions num 1 []
