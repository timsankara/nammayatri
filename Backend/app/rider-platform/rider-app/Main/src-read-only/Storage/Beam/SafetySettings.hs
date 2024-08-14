{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Storage.Beam.SafetySettings where

import qualified Database.Beam as B
import Kernel.External.Encryption
import Kernel.Prelude
import qualified Kernel.Prelude
import Tools.Beam.UtilsTH

data SafetySettingsT f = SafetySettingsT
  { autoCallDefaultContact :: B.C f Kernel.Prelude.Bool,
    enableOtpLessRide :: B.C f Kernel.Prelude.Bool,
    enablePostRideSafetyCheck :: B.C f Kernel.Prelude.Bool,
    enableUnexpectedEventsCheck :: B.C f Kernel.Prelude.Bool,
    falseSafetyAlarmCount :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Int),
    hasCompletedMockSafetyDrill :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.Bool),
    hasCompletedSafetySetup :: B.C f Kernel.Prelude.Bool,
    informPoliceSos :: B.C f Kernel.Prelude.Bool,
    nightSafetyChecks :: B.C f Kernel.Prelude.Bool,
    notifySafetyTeamForSafetyCheckFailure :: B.C f Kernel.Prelude.Bool,
    notifySosWithEmergencyContacts :: B.C f Kernel.Prelude.Bool,
    personId :: B.C f Kernel.Prelude.Text,
    safetyCenterDisabledOnDate :: B.C f (Kernel.Prelude.Maybe Kernel.Prelude.UTCTime),
    shakeToActivate :: B.C f Kernel.Prelude.Bool,
    updatedAt :: B.C f Kernel.Prelude.UTCTime
  }
  deriving (Generic, B.Beamable)

instance B.Table SafetySettingsT where
  data PrimaryKey SafetySettingsT f = SafetySettingsId (B.C f Kernel.Prelude.Text) deriving (Generic, B.Beamable)
  primaryKey = SafetySettingsId . personId

type SafetySettings = SafetySettingsT Identity

$(enableKVPG ''SafetySettingsT ['personId] [])

$(mkTableInstances ''SafetySettingsT "safety_settings")