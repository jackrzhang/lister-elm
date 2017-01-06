module App.Input.State exposing (..)

import App.Input.Types exposing (..)


-- INIT

initialModel : Model
initialModel =
    { text = ""
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of

        UpdateInput text ->
            { model | text = text }

        ClearInput ->
            { model | text = "" }