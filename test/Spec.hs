import Test.Hspec
import MapParser

main :: IO ()
main =
  hspec $
  describe "numberOfSpaces tests" $ it "returns valid number of spaces" $ numberOfSpaces 5 `shouldMatchList` "     "


