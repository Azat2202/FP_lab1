module Main

import Hedgehog
import Prob1
import Data.Vect

prob1_input : Gen Int
prob1_input = element [999]

prob1_answer : Int
prob1_answer = 233168


prob1_rec_test : Property
prob1_rec_test = property $ do 
  i <- forAll prob1_input
  prob1_rec i === prob1_answer


prob1_tailrec_test : Property
prob1_tailrec_test = property $ do 
  i <- forAll prob1_input
  prob1_tail_rec i === prob1_answer


prob1_filter_test : Property
prob1_filter_test = property $ do 
  i <- forAll prob1_input
  prob1_filter i === prob1_answer


prob1_map_test : Property
prob1_map_test = property $ do 
  i <- forAll prob1_input
  prob1_map i === prob1_answer


prob1_lazy_test : Property
prob1_lazy_test = property $ do 
  i <- forAll prob1_input
  prob1_lazy i === prob1_answer


main : IO()
main = test . pure $
    MkGroup
      "Test prob1"
      [ ("prob1 sample recursion", prob1_rec_test)
      , ("prob1 tail recursion", prob1_tailrec_test)
      , ("prob1 map", prob1_map_test)
      , ("prob1 filter", prob1_filter_test)
      , ("prob1 lazy", prob1_lazy_test)
      ]
