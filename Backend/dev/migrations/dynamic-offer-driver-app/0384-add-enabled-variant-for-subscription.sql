alter table atlas_driver_offer_bpp.transporter_config add column variants_to_enable_for_subscription text[] NOT NULL default '{AUTO_RICKSHAW}';

------------- backfill -------------
update atlas_driver_offer_bpp.transporter_config
set variants_to_enable_for_subscription = '{ARRAY_OF_VARIANTS}'
where merchant_operating_city_id in ('NAMMA-YATRI-CITIES/YATRI/PARIS');