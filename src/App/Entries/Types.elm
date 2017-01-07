module App.Entries.Types exposing (..)

import App.Control.Types exposing (Filter)

-- MODEL

type alias Entry =
    { id : Int
    , text : String
    , complete : Bool
    }


type alias Model =
    { list : List Entry
    , filter : Filter
    , currentId : Int
    }


-- MSG

type Msg
    = AddEntry String
    | RemoveEntry Int
    | ToggleComplete Int
    | ApplyFilter Filter