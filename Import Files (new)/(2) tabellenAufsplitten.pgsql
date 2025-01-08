DELETE FROM worldenergyconsumption WHERE year < 1950
DELETE FROM worldenergyconsumption WHERE iso_code is NULL;

ALTER TABLE worldenergyconsumption
ALTER COLUMN iso_code TYPE VARCHAR(4);

DROP TABLE IF EXISTS efficiency;
DROP TABLE IF EXISTS emissions;
DROP TABLE IF EXISTS energytrade;
DROP TABLE IF EXISTS allrenewables;
DROP TABLE IF EXISTS windenergy;
DROP TABLE IF EXISTS solarenergy;
DROP TABLE IF EXISTS hydroenergy;
DROP TABLE IF EXISTS biofuelenergy;
DROP TABLE IF EXISTS otherrenewables;


CREATE TABLE efficiency AS
SELECT 
    iso_code AS countryCode,
    year, 
    energy_per_capita, 
    energy_per_gdp, 
    per_capita_electricity 
FROM worldenergyconsumption;

CREATE TABLE emissions AS
SELECT 
    iso_code AS countryCode, 
    year, 
    carbon_intensity_elec, 
    greenhouse_gas_emissions 
FROM worldenergyconsumption;

CREATE TABLE energytrade AS
SELECT 
    iso_code AS countryCode, 
    year, 
    net_elec_imports, 
    net_elec_imports_share_demand 
FROM worldenergyconsumption;

CREATE TABLE allRenewables AS
SELECT 
    iso_code AS countryCode, 
    year, 
    renewables_consumption, 
    renewables_electricity, 
    renewables_share_elec
FROM worldenergyconsumption;

CREATE TABLE windenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    wind_consumption, 
    wind_electricity, 
    wind_share_elec
FROM worldenergyconsumption;

CREATE TABLE solarenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    solar_consumption, 
    solar_electricity, 
    solar_share_elec
FROM worldenergyconsumption;

CREATE TABLE hydroenergy AS
SELECT 
    iso_code AS countryCode, 
    year, 
    hydro_consumption, 
    hydro_electricity, 
    hydro_share_elec  
FROM worldenergyconsumption;

CREATE TABLE biofuelenergy AS
SELECT 
    iso_code AS countryCode,
    year, 
    biofuel_consumption, 
    biofuel_electricity, 
    biofuel_share_elec
FROM worldenergyconsumption;

CREATE TABLE otherRenewables AS
SELECT 
    iso_code AS countryCode, 
    year, 
    other_renewable_consumption, 
    other_renewable_electricity, 
    other_renewables_share_elec 
FROM worldenergyconsumption;
