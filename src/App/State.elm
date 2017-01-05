module App.State exposing (..)

import App.Types exposing (..)
import App.Input.State as Input
import App.Entries.State as Entries
import App.Control.State as Control


-- INIT

initialModel : Model
initialModel =
    { input = Input.initialModel
    , entries = Entries.initialModel
    , control = Control.initialModel
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

        ChainMsgs msgs ->
            List.foldl update model msgs

        MsgForInput inputMsg ->
            { model | input = Input.update inputMsg model.input}

        MsgForEntries entriesMsg ->
            { model | entries = Entries.update entriesMsg model.entries }

        MsgForControl controlMsg ->
            { model | control = Control.update controlMsg model.control }


updateCmd : Msg -> Cmd Msg
updateCmd msg =
    Cmd.batch
        []
