{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Domain.Types.DriverPanCard where

import Data.Aeson
import qualified Domain.Types.IdfyVerification
import qualified Domain.Types.Image
import qualified Domain.Types.Merchant
import qualified Domain.Types.Person
import Kernel.External.Encryption
import Kernel.Prelude
import qualified Kernel.Types.Id
import qualified Tools.Beam.UtilsTH

data DriverPanCardE e = DriverPanCard
  { consent :: Kernel.Prelude.Bool,
    consentTimestamp :: Kernel.Prelude.UTCTime,
    documentImageId1 :: Kernel.Types.Id.Id Domain.Types.Image.Image,
    documentImageId2 :: Kernel.Prelude.Maybe (Kernel.Types.Id.Id Domain.Types.Image.Image),
    driverDob :: Kernel.Prelude.Maybe Kernel.Prelude.UTCTime,
    driverId :: Kernel.Types.Id.Id Domain.Types.Person.Person,
    driverName :: Kernel.Prelude.Maybe Kernel.Prelude.Text,
    failedRules :: [Kernel.Prelude.Text],
    id :: Kernel.Types.Id.Id Domain.Types.DriverPanCard.DriverPanCard,
    panCardNumber :: Kernel.External.Encryption.EncryptedHashedField e Kernel.Prelude.Text,
    verificationStatus :: Domain.Types.IdfyVerification.VerificationStatus,
    merchantId :: Kernel.Prelude.Maybe (Kernel.Types.Id.Id Domain.Types.Merchant.Merchant),
    createdAt :: Kernel.Prelude.UTCTime,
    updatedAt :: Kernel.Prelude.UTCTime
  }
  deriving (Generic)

type DriverPanCard = DriverPanCardE 'AsEncrypted

type DecryptedDriverPanCard = DriverPanCardE 'AsUnencrypted

instance EncryptedItem DriverPanCard where
  type Unencrypted DriverPanCard = (DecryptedDriverPanCard, HashSalt)
  encryptItem (entity, salt) = do
    panCardNumber_ <- encryptItem (panCardNumber entity, salt)
    pure
      DriverPanCard
        { consent = consent entity,
          consentTimestamp = consentTimestamp entity,
          documentImageId1 = documentImageId1 entity,
          documentImageId2 = documentImageId2 entity,
          driverDob = driverDob entity,
          driverId = driverId entity,
          driverName = driverName entity,
          failedRules = failedRules entity,
          id = id entity,
          panCardNumber = panCardNumber_,
          verificationStatus = verificationStatus entity,
          merchantId = merchantId entity,
          createdAt = createdAt entity,
          updatedAt = updatedAt entity
        }
  decryptItem entity = do
    panCardNumber_ <- fst <$> decryptItem (panCardNumber entity)
    pure
      ( DriverPanCard
          { consent = consent entity,
            consentTimestamp = consentTimestamp entity,
            documentImageId1 = documentImageId1 entity,
            documentImageId2 = documentImageId2 entity,
            driverDob = driverDob entity,
            driverId = driverId entity,
            driverName = driverName entity,
            failedRules = failedRules entity,
            id = id entity,
            panCardNumber = panCardNumber_,
            verificationStatus = verificationStatus entity,
            merchantId = merchantId entity,
            createdAt = createdAt entity,
            updatedAt = updatedAt entity
          },
        ""
      )

instance EncryptedItem' DriverPanCard where
  type UnencryptedItem DriverPanCard = DecryptedDriverPanCard
  toUnencrypted a salt = (a, salt)
  fromUnencrypted = fst