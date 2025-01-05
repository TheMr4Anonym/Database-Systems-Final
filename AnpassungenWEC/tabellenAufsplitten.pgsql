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


CREATE TABLE efficiency AS
SELECT 
    iso_code AS countryCode,
    year, 
    energy_per_capita, 
    energy_per_gdp, 
    per_capita_electricity 
FROM student69.worldenergyconsumption;

CREATE TABLE emissions AS
SELECT 
    iso_code AS countryCode, 
    year, 
    carbon_intensity_elec, 
    greenhouse_gas_emissions 
FROM student69.worldenergyconsumption;

CREATE TABLE energytrade AS
SELECT 
    iso_code AS countryCode, 
    year, 
    net_elec_imports, 
    net_elec_imports_share_demand 
FROM student69.worldenergyconsumption;

CREATE TABLE allRenewables AS
SELECT 
    iso_code AS countryCode, 
    year, 
    renewables_consumption, 
    renewables_electricity, 
    renewables_share_elec
FROM student69.worldenergyconsumption;

CREATE TABLE windenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    wind_consumption, 
    wind_electricity, 
    wind_share_elec
FROM student69.worldenergyconsumption;

CREATE TABLE solarenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    solar_consumption, 
    solar_electricity, 
    solar_share_elec
FROM student69.worldenergyconsumption;

CREATE TABLE hydroenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    hydro_consumption, 
    hydro_electricity, 
    hydro_share_elec  
FROM student69.worldenergyconsumption;

CREATE TABLE biofuelenergy AS
SELECT 
    iso_code AS countryCode,
    year, 
    biofuel_consumption, 
    biofuel_electricity, 
    biofuel_share_elec
FROM student69.worldenergyconsumption;

CREATE TABLE otherRenewables AS
SELECT 
    iso_code AS countryCode, 
    year, 
    other_renewable_consumption, 
    other_renewable_electricity, 
    other_renewables_share_elec 
FROM student69.worldenergyconsumption;