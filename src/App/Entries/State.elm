module App.Entries.State exposing (..)

import App.Entries.Types exposing (..)
import App.Control.Types exposing (Filter(..))


-- INIT

initialModel : Model
initialModel =
    { list = initialList
    , filter = initialFilter
    }


initialList : List Entry
initialList =
    [ Entry 0 "First Entry" False
    , Entry 1 "Second Entry" True
    ]


initialFilter : Filter
initialFilter
    = All


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of

        AddEntry entry ->
            { model | list = List.append model.list [ entry ] }

        ApplyFilter filter ->
            { model | filter = filter }