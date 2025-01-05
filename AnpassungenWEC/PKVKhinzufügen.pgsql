ALTER TABLE student69.emissions ADD COLUMN EmissionsId SERIAL PRIMARY KEY;
ALTER TABLE student69.emissions ADD CONSTRAINT fk_country_emissions 
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.energytrade ADD COLUMN TradeId SERIAL PRIMARY KEY;
ALTER TABLE student69.energytrade ADD CONSTRAINT fk_country_energytrade
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.allrenewables ADD COLUMN renewbalesId SERIAL PRIMARY KEY;
ALTER TABLE student69.allrenewables ADD CONSTRAINT fk_country_allrenewables
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.windenergy ADD COLUMN windId SERIAL PRIMARY KEY;
ALTER TABLE student69.windenergy ADD CONSTRAINT fk_country_windenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.solarenergy ADD COLUMN solarId SERIAL PRIMARY KEY;
ALTER TABLE student69.solarenergy ADD CONSTRAINT fk_country_solarenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.hydroenergy ADD COLUMN hydroId SERIAL PRIMARY KEY;
ALTER TABLE student69.hydroenergy ADD CONSTRAINT fk_country_hydroenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.biofuelenergy ADD COLUMN biofuelId SERIAL PRIMARY KEY;
ALTER TABLE student69.biofuelenergy ADD CONSTRAINT fk_country_biofuelenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

ALTER TABLE student69.otherrenewables ADD COLUMN otherRenewablesId SERIAL PRIMARY KEY;
ALTER TABLE student69.otherrenewables ADD CONSTRAINT fk_country_otherrenewables
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;