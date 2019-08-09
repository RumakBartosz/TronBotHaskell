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
        foldList "ooooo/oR3o/ooooo" `shouldMatchList` ["ooooo","/oR3o","/ooooo"]
      it "returns unchanged on one dimensional TronMap" $
        foldList "oR3o" `shouldMatchList` ["oR3o"]
    describe "cleaList tests" $ do
      it "returns valid clear" $
        clearList ["ooooo","/oR3o","/ooooo"] `shouldMatchList` ["ooooo","oR3o","ooooo"]
      it "returns valid unchanged value" $
        clearList ["oooo","oR2o","oooo"] `shouldMatchList` ["oooo","oR2o","oooo"]
