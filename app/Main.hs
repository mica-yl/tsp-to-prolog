module Main where

import qualified T2P 
import qualified CombinatorialOptimisation.TSP as TSP
import qualified FileFormat.TSPLIB as FF 
import qualified System.Environment as SE (getArgs)

solvefile :: String -> IO () 
solvefile tspfile  =do tsp <- FF.loadTSPFile TSP.ExplicitMatrix (tspfile)
                       putStrLn (T2P.showTSP tsp)


main :: IO ()
main = do 
      args <- SE.getArgs
      case args of 
         [tspfile] -> solvefile tspfile        
         _         -> putStrLn "error in args." 

