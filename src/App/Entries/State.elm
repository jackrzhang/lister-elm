module App.Entries.State exposing (..)

import App.Entries.Types exposing (..)
import App.Control.Types exposing (Filter(..))


-- INIT

initialModel : Model
initialModel =
    { list = []
    , filter = All
    , currentId = 0
    }


init : ( Model, Cmd Msg )
init =
    initialModel ! []


-- UPDATE

updateModel : Msg -> Model -> Model
updateModel msg model =
    case msg of

        AddEntry text ->
            { model 
                | list = List.append model.list [ Entry model.currentId text False ]
                , currentId = model.currentId + 1
            }

        RemoveEntry id ->
            { model | list = List.filter (\entry -> not <| entry.id == id) model.list }

        ToggleComplete id ->
            { model | list = toggleComplete id model.list }

        ApplyFilter filter ->
            { model | filter = filter }


toggleComplete : Int -> List Entry -> List Entry
toggleComplete id list =
    List.map (updateEntry id) list


updateEntry : Int -> (Entry -> Entry)
updateEntry id =
    \entry ->
        if entry.id == id then
            { entry | complete = not entry.complete }
        else
            entry
