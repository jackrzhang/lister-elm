module App.State exposing (..)

import App.Types exposing (..)
import App.Input.State as Input


-- INIT

initialModel : Model
initialModel =
    { input = Input.initialModel
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

updateWithCmd : Msg -> Model -> ( Model, Cmd Msg )
updateWithCmd msg model =
    ( update msg model, updateCmd msg )


update : Msg -> Model -> Model
update msg model =
    case msg of

        NoOp ->
            model

        MsgForInput inputMsg ->
            { model | input = Input.update inputMsg model.input}


updateCmd : Msg -> Cmd Msg
updateCmd msg =
    Cmd.batch
        []
