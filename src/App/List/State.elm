module App.List.State exposing (..)

import App.List.Types exposing (..)


-- INIT

initialModel : Model
initialModel =
    []


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of
        
        NoOp ->
            model
