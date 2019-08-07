module MapParser
    ( numberParser, numberOfSpaces, foldList
    ) where

import Text.Read
import Data.Maybe

--TODO: split list on a '/'

numberOfSpaces :: Int -> String
numberOfSpaces 1 = " "
numberOfSpaces x = ' ' : numberOfSpaces (x - 1)

numberParser :: String -> String
numberParser [] = []
numberParser [x] = [x]
numberParser (x:y:xs)
  | isJust (readMaybe [x, y] :: Maybe Int) = numberOfSpaces (fromJust (readMaybe [x, y] :: Maybe Int)) ++ numberParser xs
numberParser (x:xs)
  | isJust (readMaybe [x] :: Maybe Int) = numberOfSpaces (fromJust (readMaybe [x] :: Maybe Int)) ++ numberParser xs
  | otherwise = x : numberParser xs

foldList :: String -> [String]
foldList [] = [[]]
foldList [x] = [[x]]
foldList (x:xs)
  | x == '/' = [x] : foldList xs
  | otherwise = [x : concat (foldList xs)]