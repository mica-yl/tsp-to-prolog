module T2P (showTSP) where

import qualified CombinatorialOptimisation.TSP as TSP (numCities,TSPProblem(..),edgeCost)
import CombinatorialOptimisation.TSP (TSPProblem(..))
import qualified Control.Monad as M (guard)
-- import qualified TSPutils as U

type Cost = Double  
type Node = Int
type CitiesNo = Int
type Path = [Node]
type Edge = (Node,Node)
type CEdge = (Node,Node,Cost)

showTSP :: TSPProblem -> String 
showTSP = prettyTSP . convertor 
prettyTSP :: [CEdge] -> String 
prettyTSP = concatMap (\e -> prettyEdge e ++ "\n")

prettyEdge :: CEdge -> String 
prettyEdge (a,b,c) = "edge("++ 
                       showC a ++","++
                       showC b ++","++
                       show c ++")." 

showC :: Int -> String 
showC n =  last . take (n+1) $ list
      where list = l ++ map (++"a") list 
            l = map (:"") $ ['a'..'z']++['A'..'Z']

convertor :: TSPProblem -> [CEdge]
convertor x = map edgeCost'  . edgeGenerator $ citiesNum
      where citiesNum = numCities x -1
            edgeCost' = edgeCost x

edgeGenerator :: CitiesNo -> [Edge]
edgeGenerator n = do 
                   x <- [0..n]
                   y <- [0..n]
                   M.guard (x /= y)
                   return (x,y)

edgeCost :: TSPProblem -> Edge -> CEdge
edgeCost p (a,b) = (a,b,c)
     where c = TSP.edgeCost p a b 
