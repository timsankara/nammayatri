CREATE TABLE atlas_bpp_dashboard.fleet_member_association ();

ALTER TABLE atlas_bpp_dashboard.fleet_member_association ADD COLUMN created_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_bpp_dashboard.fleet_member_association ADD COLUMN enabled boolean NOT NULL;
ALTER TABLE atlas_bpp_dashboard.fleet_member_association ADD COLUMN fleet_member_id text NOT NULL;
ALTER TABLE atlas_bpp_dashboard.fleet_member_association ADD COLUMN fleet_owner_id text NOT NULL;
ALTER TABLE atlas_bpp_dashboard.fleet_member_association ADD COLUMN updated_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_bpp_dashboard.fleet_member_association ADD PRIMARY KEY ( fleet_member_id);