module Screens.ScheduledRideAcceptedScreen.Controller where

import Debug
import Prelude
import Screens.RideSummaryScreen.ScreenData
import Components.SourceToDestination.Controller as SourceToDestinationController
import PrestoDOM (Eval, continue, exit, update)
import PrestoDOM.Types.Core (class Loggable, defaultPerformLog)
import Screens (ScreenName(..), getScreen)
import Services.API
import Screens.ScheduledRideAcceptedScreen.ScreenData

instance showAction  ::  Show Action where
  show _ = ""
instance loggableAction :: Loggable Action where
  performLog = defaultPerformLog

data Action = 
    OnClick
    
data ScreenOutput = 
    GoHome


eval :: Action -> ScheduleRideAcceptedScreenState -> Eval Action ScreenOutput ScheduleRideAcceptedScreenState
eval  OnClick state = exit GoHome