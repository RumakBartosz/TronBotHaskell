module MapParser
    ( numberParser, numberOfSpaces
    ) where

--TODO: change numbers in list to spaces -- fold list on a '/'

numberOfSpaces :: Int -> String
numberOfSpaces 1 = " "
numberOfSpaces x = ' ' : numberOfSpaces (x - 1)

numberParser :: [a] -> [[a]]
numberParser [] = [[]]
