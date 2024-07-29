{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-dodgy-exports #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Domain.Types.Extra.Ride where

import Data.Aeson
import qualified Domain.Types.Ride
import qualified Domain.Types.VehicleServiceTier
import qualified Domain.Types.VehicleVariant
import Kernel.External.Encryption
import Kernel.Prelude
import qualified Kernel.Types.Common
import qualified Kernel.Types.Confidence
import qualified Kernel.Types.Id
import qualified Kernel.Types.Time
import Kernel.Utils.TH

-- Extra code goes here --
data RideAPIEntity = RideAPIEntity
  { allowedEditLocationAttempts :: Kernel.Prelude.Int,
    allowedEditPickupLocationAttempts :: Kernel.Prelude.Int,
    bppRideId :: Kernel.Types.Id.Id Domain.Types.Ride.BPPRide,
    chargeableRideDistance :: Kernel.Prelude.Maybe Kernel.Types.Common.HighPrecMeters,
    chargeableRideDistanceWithUnit :: Kernel.Prelude.Maybe Kernel.Types.Common.Distance,
    computedPrice :: Kernel.Prelude.Maybe Kernel.Types.Common.Money,
    computedPriceWithCurrency :: Kernel.Prelude.Maybe Kernel.Types.Common.PriceAPIEntity,
    createdAt :: Kernel.Prelude.UTCTime,
    driverArrivalTime :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    driverImage :: Kernel.Prelude.Maybe Kernel.Prelude.Text,
    driverName :: Kernel.Prelude.Text,
    driverNumber :: Kernel.Prelude.Maybe Kernel.Prelude.Text,
    driverRatings :: Kernel.Prelude.Maybe Kernel.Types.Common.Centesimal,
    driverRegisteredAt :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    endOdometerReading :: Kernel.Prelude.Maybe Kernel.Types.Common.Centesimal,
    endOtp :: Kernel.Prelude.Maybe Kernel.Prelude.Text,
    id :: Kernel.Types.Id.Id Domain.Types.Ride.Ride,
    isFreeRide :: Kernel.Prelude.Maybe Kernel.Prelude.Bool,
    onlinePayment :: Kernel.Prelude.Bool,
    rideEndTime :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    rideOtp :: Kernel.Prelude.Text,
    rideRating :: Kernel.Prelude.Maybe Kernel.Prelude.Int,
    rideStartTime :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    shortRideId :: Kernel.Types.Id.ShortId Domain.Types.Ride.Ride,
    startOdometerReading :: Kernel.Prelude.Maybe Kernel.Types.Common.Centesimal,
    status :: Domain.Types.Ride.RideStatus,
    tollConfidence :: Kernel.Prelude.Maybe Kernel.Types.Confidence.Confidence,
    traveledRideDistance :: Kernel.Prelude.Maybe Kernel.Types.Common.Distance,
    updatedAt :: Kernel.Prelude.UTCTime,
    vehicleAge :: Kernel.Prelude.Maybe Kernel.Types.Time.Months,
    vehicleColor :: Kernel.Prelude.Text,
    vehicleModel :: Kernel.Prelude.Text,
    vehicleNumber :: Kernel.Prelude.Text,
    vehicleServiceTierType :: Kernel.Prelude.Maybe Domain.Types.VehicleServiceTier.VehicleServiceTierType,
    vehicleVariant :: Domain.Types.VehicleVariant.VehicleVariant,
    favCount :: Kernel.Prelude.Maybe Kernel.Prelude.Int,
    isAlreadyFav :: Kernel.Prelude.Maybe Kernel.Prelude.Bool
  }
  deriving (Generic, Show, ToJSON, FromJSON, ToSchema)