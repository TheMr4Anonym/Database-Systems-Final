ALTER TABLE efficiency ADD COLUMN EfficencyId SERIAL PRIMARY KEY;

ALTER TABLE efficiency ADD CONSTRAINT fk_country_efficiency
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE emissions ADD COLUMN EmissionsId SERIAL PRIMARY KEY;

ALTER TABLE emissions ADD CONSTRAINT fk_country_emissions 
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE energytrade ADD COLUMN TradeId SERIAL PRIMARY KEY;

ALTER TABLE energytrade ADD CONSTRAINT fk_country_energytrade
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE allrenewables ADD COLUMN renewbalesId SERIAL PRIMARY KEY;

ALTER TABLE allrenewables ADD CONSTRAINT fk_country_allrenewables
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE windenergy ADD COLUMN windId SERIAL PRIMARY KEY;

ALTER TABLE windenergy ADD CONSTRAINT fk_country_windenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE solarenergy ADD COLUMN solarId SERIAL PRIMARY KEY;

ALTER TABLE solarenergy ADD CONSTRAINT fk_country_solarenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE hydroenergy ADD COLUMN hydroId SERIAL PRIMARY KEY;

ALTER TABLE hydroenergy ADD CONSTRAINT fk_country_hydroenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE biofuelenergy ADD COLUMN biofuelId SERIAL PRIMARY KEY;

ALTER TABLE biofuelenergy ADD CONSTRAINT fk_country_biofuelenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE otherrenewables ADD COLUMN otherRenewablesId SERIAL PRIMARY KEY;

ALTER TABLE otherrenewables ADD CONSTRAINT fk_country_otherrenewables
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;