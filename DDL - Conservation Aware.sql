IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'ConservationAware')
CREATE DATABASE ConservationAware;
GO

USE ConservationAware;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'animals' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE animals (
    id INT PRIMARY KEY IDENTITY(1,1),
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    description VARCHAR(MAX),
    estimated_population INT
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'habitat_conservation_status' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE habitat_conservation_status (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'climates' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE climates(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'habitats' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE habitats(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX),
    id_habitat_conservation_status INT,
    CONSTRAINT FK_habitat_conservation_status FOREIGN KEY (id_habitat_conservation_status) REFERENCES habitat_conservation_status(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'animals_habitats' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE animals_habitats (
    id INT PRIMARY KEY IDENTITY(1,1),
    animal_id INT,
    habitat_id INT,
    CONSTRAINT FK_animal FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT FK_habitat FOREIGN KEY (habitat_id) REFERENCES habitats(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'geographical_location' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE geographical_location (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX),
    location VARCHAR(200),
    climate_id INT,
    habitat_id INT,
    CONSTRAINT FK_climate FOREIGN KEY (climate_id) REFERENCES climates(id),
    CONSTRAINT FK_habitat_geo FOREIGN KEY (habitat_id) REFERENCES habitats(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'feedings' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE feedings(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'species_conservation_status' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE species_conservation_status(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'species' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE species(
    id INT PRIMARY KEY IDENTITY(1,1),
    scientific_name VARCHAR(100),
    description VARCHAR(MAX),
    life_expectancy INT,
    animal_id INT,
    feeding_id INT,
    specie_conservation_status INT,
    CONSTRAINT FK_animal_species FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT FK_feeding_species FOREIGN KEY (feeding_id) REFERENCES feedings(id),
    CONSTRAINT FK_conservation_species FOREIGN KEY (specie_conservation_status) REFERENCES species_conservation_status(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'threat_types' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE threat_types(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'threats' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE threats(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX),
    id_threat_type INT,
    CONSTRAINT FK_threat_type FOREIGN KEY (id_threat_type) REFERENCES threat_types(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'species_threats' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE species_threats(
    id INT PRIMARY KEY IDENTITY(1,1),
    specie_id INT,
    threat_id INT,
    CONSTRAINT FK_species_threats_species FOREIGN KEY (specie_id) REFERENCES species(id),
    CONSTRAINT FK_species_threats_threat FOREIGN KEY (threat_id) REFERENCES threats(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'associations_types' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE associations_types(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'associations' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE associations(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX),
    association_type_id INT,
    CONSTRAINT FK_association_type FOREIGN KEY (association_type_id) REFERENCES associations_types(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'species_associations' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE species_associations(
    id INT PRIMARY KEY IDENTITY(1,1),
    specie_id INT,
    association_id INT,
    CONSTRAINT FK_species_associations_species FOREIGN KEY (specie_id) REFERENCES species(id),
    CONSTRAINT FK_species_associations_association FOREIGN KEY (association_id) REFERENCES associations(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contact_types' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE contact_types(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contact_information' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE contact_information(
    id INT PRIMARY KEY IDENTITY(1,1),
    contact VARCHAR(250),
    association_id INT,
    contact_type_id INT,
    CONSTRAINT FK_contact_association FOREIGN KEY (association_id) REFERENCES associations(id),
    CONSTRAINT FK_contact_type FOREIGN KEY (contact_type_id) REFERENCES contact_types(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'measurement_types' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE measurement_types(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'impact_assessments' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE impact_assessments(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'implementations_status' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE implementations_status(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'prevention_measures' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE prevention_measures(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    manager VARCHAR(100),
    description VARCHAR(MAX),
    start_date DATETIME,
    end_date DATETIME,
    economic_investment FLOAT,
    measurement_type_id INT,
    impact_assessment_id INT,
    implementation_status_id INT,
    CONSTRAINT FK_measurement_type FOREIGN KEY (measurement_type_id) REFERENCES measurement_types(id),
    CONSTRAINT FK_impact_assessment FOREIGN KEY (impact_assessment_id) REFERENCES impact_assessments(id),
    CONSTRAINT FK_implementation_status FOREIGN KEY (implementation_status_id) REFERENCES implementations_status(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'associations_prevention_measures' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE associations_prevention_measures(
    id INT PRIMARY KEY IDENTITY(1,1),
    association_id INT,
    prevention_measures_id INT,
    CONSTRAINT FK_association_pm_association FOREIGN KEY (association_id) REFERENCES associations(id),
    CONSTRAINT FK_association_pm_prevention FOREIGN KEY (prevention_measures_id) REFERENCES prevention_measures(id)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'roles' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE roles(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    description VARCHAR(MAX)
);
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'users' AND SCHEMA_NAME(schema_id) = 'dbo')
CREATE TABLE users(
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    lastname_1 VARCHAR(100),
    lastname_2 VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    birthdate DATE,
    id_roles INT,
    CONSTRAINT FK_user_role FOREIGN KEY (id_roles) REFERENCES roles(id)
);
GO