ALTER TABLE allrenewables
ADD CONSTRAINT fk_country_allrenewables
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE biofuelenergy
ADD CONSTRAINT fk_country_biofuelenergy
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE efficiency
ADD CONSTRAINT fk_country_efficiency
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE emissions
ADD CONSTRAINT fk_country_emissions
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE energytrade
ADD CONSTRAINT fk_country_energytrade
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE hydroenergy
ADD CONSTRAINT fk_country_hydroenergy
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE otherrenewables
ADD CONSTRAINT fk_country_otherrenewables
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE solarenergy
ADD CONSTRAINT fk_country_solarenergy
FOREIGN KEY (code)
REFERENCES country (code);

ALTER TABLE windenergy
ADD CONSTRAINT fk_country_windenergy
FOREIGN KEY (code)
REFERENCES country (code);
