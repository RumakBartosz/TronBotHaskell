import Test.Hspec
import MapParser

main :: IO ()
main =
  hspec $ do
    describe "numberOfSpaces tests" $
      it "returns valid number of spaces" $
        numberOfSpaces 5 `shouldMatchList` "     "
    describe "numberParser tests" $ do
      it "returns valid parse" $
        numberParser "ooooo/oR3o/ooooo" `shouldMatchList` "ooooo/oR   o/ooooo"
      it "returns valid parse on number >= 10" $
        numberParser "oooooooooooo/oR9o/oooooooooooo" `shouldMatchList` "oooooooooooo/oR         o/oooooooooooo"
    describe "foldList tests" $ do
      it "return valid fold" $
        foldList "ooooo/oR3o/ooooo" `shouldMatchList` ["ooooo","oR3o","ooooo"]
