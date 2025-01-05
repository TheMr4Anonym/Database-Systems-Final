DELETE FROM student69.worldenergyconsumption WHERE year < 2000;
DELETE FROM student69.worldenergyconsumption WHERE iso_code is NULL;

ALTER TABLE student69.worldenergyconsumption
ALTER COLUMN iso_code TYPE VARCHAR(4);

DROP TABLE IF EXISTS student69.efficiency;
DROP TABLE IF EXISTS student69.emissions;
DROP TABLE IF EXISTS student69.energytrade;
DROP TABLE IF EXISTS student69.allrenewables;
DROP TABLE IF EXISTS student69.windenergy;
DROP TABLE IF EXISTS student69.solarenergy;
DROP TABLE IF EXISTS student69.hydroenergy;
DROP TABLE IF EXISTS student69.biofuelenergy;
DROP TABLE IF EXISTS student69.otherrenewables;


CREATE TABLE Efficiency AS
SELECT 
    iso_code AS countryCode,
    year, 
    energy_per_capita, 
    energy_per_gdp, 
    per_capita_electricity 
FROM student69.worldenergyconsumption;

ALTER TABLE student69.efficiency ADD COLUMN EfficencyId SERIAL PRIMARY KEY;

ALTER TABLE student69.efficiency 
ADD CONSTRAINT fk_country_efficiency
FOREIGN KEY (countryCode) 
REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE Emissions AS
SELECT 
    iso_code AS countryCode, 
    year, 
    carbon_intensity_elec, 
    greenhouse_gas_emissions 
FROM student69.worldenergyconsumption;

ALTER TABLE student69.emissions ADD COLUMN EmissionsId SERIAL PRIMARY KEY;

ALTER TABLE student69.emissions 
ADD CONSTRAINT fk_country_emissions
FOREIGN KEY (countryCode) 
REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE Energytrade AS
SELECT 
    iso_code AS countryCode, 
    year, 
    net_elec_imports, 
    net_elec_imports_share_demand 
FROM student69.worldenergyconsumption;

ALTER TABLE student69.energytrade ADD COLUMN TradeId SERIAL PRIMARY KEY;

ALTER TABLE student69.energytrade ADD CONSTRAINT fk_country_energytrade
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE AllRenewables AS
SELECT 
    iso_code AS countryCode, 
    year, 
    renewables_consumption, 
    renewables_electricity, 
    renewables_share_elec
FROM student69.worldenergyconsumption;

ALTER TABLE student69.allrenewables ADD COLUMN renewbalesId SERIAL PRIMARY KEY;

ALTER TABLE student69.allrenewables ADD CONSTRAINT fk_country_allrenewables
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE Windenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    wind_consumption, 
    wind_electricity, 
    wind_share_elec
FROM student69.worldenergyconsumption;

ALTER TABLE student69.windenergy ADD COLUMN windId SERIAL PRIMARY KEY;

ALTER TABLE student69.windenergy ADD CONSTRAINT fk_country_windenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE Solarenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    solar_consumption, 
    solar_electricity, 
    solar_share_elec
FROM student69.worldenergyconsumption;

ALTER TABLE student69.solarenergy ADD COLUMN solarId SERIAL PRIMARY KEY;

ALTER TABLE student69.solarenergy ADD CONSTRAINT fk_country_solarenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE Hydroenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    hydro_consumption, 
    hydro_electricity, 
    hydro_share_elec  
FROM student69.worldenergyconsumption;

ALTER TABLE student69.hydroenergy ADD COLUMN hydroId SERIAL PRIMARY KEY;

ALTER TABLE student69.hydroenergy ADD CONSTRAINT fk_country_hydroenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE Biofuelenergy AS
SELECT 
    iso_code AS countryCode,
    year, 
    biofuel_consumption, 
    biofuel_electricity, 
    biofuel_share_elec
FROM student69.worldenergyconsumption;

ALTER TABLE student69.biofuelenergy ADD COLUMN biofuelId SERIAL PRIMARY KEY;

ALTER TABLE student69.biofuelenergy ADD CONSTRAINT fk_country_biofuelenergy
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;

CREATE TABLE OtherRenewables AS
SELECT 
    iso_code AS countryCode, 
    year, 
    other_renewable_consumption, 
    other_renewable_electricity, 
    other_renewables_share_elec 
FROM student69.worldenergyconsumption;

ALTER TABLE student69.otherrenewables ADD COLUMN otherRenewablesId SERIAL PRIMARY KEY;

ALTER TABLE student69.otherrenewables ADD CONSTRAINT fk_country_otherrenewables
FOREIGN KEY (countryCode) REFERENCES public.country(code)
ON DELETE CASCADE;