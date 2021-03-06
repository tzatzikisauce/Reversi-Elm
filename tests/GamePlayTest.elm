module GamePlayTest exposing (..)

import Update exposing (Msg(..), update)
import Models.GameState exposing (initGameState)
import Set
import Dict

import Test exposing (..)
import Expect

import Logics.GamePlay exposing (..)

neighborsTest : Test
neighborsTest =
    describe "Neighbors"
        [ test "Neighbors of a middle place" <|
              \_ ->
                  Expect.equal (Set.fromList (neighbors (3, 3)))
                   (Set.fromList [(2,2),(2,3),(2,4),(3,2),(3,4),(4,2),(4,3),(4,4)]),
            test "Neighbors of a edge" <|
              \_ ->
                  Expect.equal (Set.fromList(neighbors (0, 0)))
                   (Set.fromList [(1, 1),(0,1),(1,0)]),
            test "Neighbors of a coordninate out of index is empty" <|
              \_ ->
                  Expect.equal (neighbors (-1, -1)) []
        ]

allPotentialMovesTest : Test
allPotentialMovesTest =
    describe "get all possible moves"
        [test "possible moves of initial condition" <|
            \_->
                Expect.equal
             (List.length (allPotentialMoves initGameState)) 12
        ]

sandwichesTest : Test
sandwichesTest =
    describe "get list of sandwiches"
        [test "List of sandwiches in the initial model" <|
            \_->
                Expect.equal
             (listOfSandwiches initGameState (3,2))
             [[(3,3)]]
        ]

validMovesTest : Test
validMovesTest =
    describe "get all valid moves"
        [test "valid moves of initial condition" <|
            \_->
                Expect.equal
             (Set.fromList <|
                  Dict.keys <|
                  (allValidMoves initGameState))
             (Set.fromList [(3,2), (2,3), (4,5), (5,4)])
        ]
