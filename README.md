# tsp2prolog

simple tool to convert .tsp files to prolog code 

ex: for tsp file turned to prolog 

```
NAME : PS001
TYPE : TSP
DIMENSION: 4
EDGE_WEIGHT_TYPE : EUC_2D
NODE_COORD_SECTION
  1 288 149
  2 288 129
  3 270 133
  4 256 141
EOF

```


```prolog
edge(nA,nB,20.0).
edge(nA,nC,24.083189157536253).
edge(nA,nD,32.984845004742965).
edge(nB,nA,20.0).
edge(nB,nC,18.43908891454339).
edge(nB,nD,34.17601498123258).
edge(nC,nA,24.083189157536253).
edge(nC,nB,18.43908891454339).
edge(nC,nD,16.124515496427193).
edge(nD,nA,32.984845004742965).
edge(nD,nB,34.17601498123258).
edge(nD,nC,16.124515496427193).
```

