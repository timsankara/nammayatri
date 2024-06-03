{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Domain.Types.FleetDriverAssociation where

import Data.Aeson
import qualified Domain.Types.Person
import Kernel.Prelude
import qualified Kernel.Types.Id
import qualified Tools.Beam.UtilsTH

data FleetDriverAssociation = FleetDriverAssociation
  { associatedOn :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    associatedTill :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    createdAt :: Kernel.Prelude.UTCTime,
    driverId :: Kernel.Types.Id.Id Domain.Types.Person.Person,
    fleetOwnerId :: Kernel.Prelude.Text,
    id :: Kernel.Types.Id.Id Domain.Types.FleetDriverAssociation.FleetDriverAssociation,
    isActive :: Kernel.Prelude.Bool,
    updatedAt :: Kernel.Prelude.UTCTime
  }
  deriving (Generic, Show, ToJSON, FromJSON, ToSchema)