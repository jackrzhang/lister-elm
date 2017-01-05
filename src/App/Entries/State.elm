module App.Entries.State exposing (..)

import App.Entries.Types exposing (..)


-- INIT

initialModel : Model
initialModel =
    [ Entry 0 "First Entry" False
    , Entry 1 "Second Entry" True
    ]


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of

        AddEntry entry ->
            List.append model [ entry ]