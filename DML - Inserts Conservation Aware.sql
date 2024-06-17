INSERT INTO habitat_conservation_status (name, description) 
VALUES 
    ('En peligro cr�tico', 'Indica que el h�bitat enfrenta un riesgo extremadamente alto de extinci�n debido a la p�rdida de h�bitat, fragmentaci�n, degradaci�n y otras amenazas significativas.'),
    ('En peligro', 'Sugiere que el h�bitat enfrenta un riesgo alto de extinci�n si las amenazas actuales contin�an sin ser abordadas adecuadamente, como la deforestaci�n, la urbanizaci�n y la contaminaci�n.'),
    ('Vulnerable', 'Se refiere a h�bitats que enfrentan un riesgo moderado de extinci�n si las amenazas persisten o aumentan, como la sobreexplotaci�n de recursos y el cambio clim�tico.'),
    ('Casi amenazado', 'Indica que el h�bitat no cumple los criterios para ser clasificado como en peligro o vulnerable, pero enfrenta un riesgo potencial de extinci�n si las amenazas contin�an.'),
    ('Preocupaci�n menor', 'Se refiere a h�bitats que no enfrentan un riesgo significativo de extinci�n en un futuro cercano, pero a�n pueden requerir medidas de conservaci�n para prevenir futuros problemas.');

	INSERT INTO species_conservation_status (name, description) 
VALUES 
    ('En peligro cr�tico', 'Indica que la especie enfrenta un riesgo extremadamente alto de extinci�n en la naturaleza debido a la p�rdida de h�bitat, la caza, la contaminaci�n u otras amenazas significativas.'),
    ('En peligro', 'Sugiere que la especie enfrenta un riesgo alto de extinci�n en la naturaleza si las amenazas actuales contin�an sin ser abordadas adecuadamente, como la degradaci�n del h�bitat y el cambio clim�tico.'),
    ('Vulnerable', 'Se refiere a especies que enfrentan un riesgo moderado de extinci�n en la naturaleza si las amenazas persisten o aumentan, como la sobreexplotaci�n de recursos y la introducci�n de especies invasoras.'),
    ('Casi amenazado', 'Indica que la especie no cumple los criterios para ser clasificada como en peligro o vulnerable, pero enfrenta un riesgo potencial de extinci�n si las amenazas contin�an.'),
    ('Preocupaci�n menor', 'Se refiere a especies que no enfrentan un riesgo significativo de extinci�n en un futuro cercano, pero a�n pueden requerir medidas de conservaci�n para mantener sus poblaciones estables.');

	INSERT INTO animals (common_name, scientific_name, description, estimated_population) 
VALUES 
    ('Lince', 'Lynx rufus', 'El lince es un felino end�mico de M�xico, conocido por su pelaje rojizo y sus caracter�sticos mechones en las orejas. Se encuentra en peligro de extinci�n debido a la p�rdida de h�bitat y la caza furtiva. Su poblaci�n se ha reducido dr�sticamente en las �ltimas d�cadas.', 500),
    ('Tortuga', 'Gopherus agassizii', 'La tortuga es una especie de tortuga terrestre end�mica de los desiertos del suroeste de los Estados Unidos y el norte de M�xico. Se encuentra en peligro de extinci�n debido a la degradaci�n de su h�bitat, el tr�fico ilegal de mascotas y la depredaci�n por parte de animales introducidos.', 1000),
    ('Zorro', 'Vulpes vulpes', 'El zorro es un mam�fero carn�voro de la familia Canidae. Algunas de sus especies, como el zorro gris o zorro plateado, se encuentran en peligro de extinci�n en M�xico debido a la p�rdida de h�bitat y la caza.', 300),
    ('Quetzal', 'Pharomachrus mocinno', 'El quetzal es un ave emblem�tica de M�xico, conocida por su colorido plumaje y su importancia cultural en las civilizaciones mesoamericanas. Se encuentra en peligro de extinci�n debido a la deforestaci�n y la fragmentaci�n de su h�bitat, as� como a la captura ilegal para el comercio de aves ex�ticas.', 200),
    ('Tapir', 'Tapirus bairdii', 'El tapir es un mam�fero herb�voro que habita en los bosques tropicales y subtropicales de M�xico y Centroam�rica. Se encuentra en peligro de extinci�n debido a la p�rdida y degradaci�n de su h�bitat, as� como a la caza furtiva para obtener su carne y piel.', 500);

INSERT INTO species (scientific_name, description, life_expectancy, animal_id, feeding_id, specie_conservation_status)
VALUES 
    ('Lynx rufus', 'El lince rojo es una especie de felino end�mica de Am�rica del Norte. Habita principalmente en bosques y zonas monta�osas. Su poblaci�n ha disminuido debido a la p�rdida de h�bitat y la caza furtiva.', 10, 1, 1, 2),
    ('Gopherus agassizii', 'La tortuga del desierto es una especie de tortuga terrestre que habita en los desiertos del suroeste de los Estados Unidos y el norte de M�xico. Se encuentra en peligro de extinci�n debido a la destrucci�n de su h�bitat y al comercio ilegal de mascotas.', 50, 2, 2, 1),
    ('Vulpes vulpes', 'El zorro rojo es un mam�fero carn�voro de la familia Canidae. Habita en una amplia variedad de h�bitats, desde bosques hasta �reas urbanas. Su principal amenaza es la caza y la p�rdida de h�bitat.', 8, 3, 3, 4),
    ('Quetzal', 'El quetzal es un ave tropical que habita en los bosques nubosos de Am�rica Central y M�xico. Es conocido por su plumaje colorido y su importancia cultural para las civilizaciones mesoamericanas. La deforestaci�n es su principal amenaza.', 15, 4, 4, 1),
    ('Tapir', 'El tapir centroamericano es un mam�fero herb�voro que habita en los bosques tropicales de M�xico y Centroam�rica. Se encuentra en peligro de extinci�n debido a la p�rdida y degradaci�n de su h�bitat, as� como a la caza furtiva.', 20, 5, 5, 2);

	INSERT INTO habitats (name, description, id_habitat_conservation_status)
VALUES
    ('Bosque de pino-encino', 'Este h�bitat se caracteriza por la presencia predominante de �rboles de pino y encino, con suelos generalmente �cidos y una amplia diversidad de especies de plantas y animales. Se encuentra en peligro debido a la deforestaci�n y la actividad humana.', 1),
    ('Desierto', 'El desierto es un h�bitat �rido y seco con suelos arenosos o rocosos y escasa vegetaci�n. Las temperaturas pueden variar ampliamente entre el d�a y la noche. Este h�bitat se encuentra en peligro debido a la degradaci�n del suelo y la urbanizaci�n.', 5),
    ('Bosque templado', 'Los bosques templados se caracterizan por una diversidad de �rboles caducifolios que pierden sus hojas en oto�o. Este h�bitat es com�n en regiones con estaciones distintas y presenta una rica biodiversidad. Est� en peligro debido a la deforestaci�n y la expansi�n urbana.', 3),
    ('Bosque nuboso', 'Los bosques nubosos son ecosistemas h�medos y monta�osos cubiertos por nubes la mayor parte del tiempo. La vegetaci�n es densa y diversa, con una gran cantidad de plantas epifitas. Este h�bitat se encuentra en peligro debido a la deforestaci�n y el cambio clim�tico.', 4),
    ('Bosque tropical', 'Los bosques tropicales son algunos de los h�bitats m�s biodiversos del mundo, con una gran variedad de especies de �rboles, plantas y animales. Estos bosques se caracterizan por su clima c�lido y h�medo durante todo el a�o. Se encuentran en peligro debido a la deforestaci�n y la actividad agr�cola.', 1);

	INSERT INTO animals_habitats (animal_id, habitat_id) 
VALUES 
    (1, 1),  
    (2, 2),  
    (3, 3),  
    (4, 4), 
    (5, 5);

	INSERT INTO geographical_location (name, description, location, climate_id, habitat_id) 
VALUES 
    ('Sierra Madre Occidental', 'Bosque con predominancia de �rboles de pino y encino. Caracter�stico de zonas monta�osas en climas templados.', 'Sierra Madre Occidental, M�xico (Chihuahua, Durango, Sinaloa)', 3, 1),
    ('Desierto de Sonora', 'Regi�n con escasa vegetaci�n y precipitaci�n. Condiciones extremas de temperatura y aridez.', 'Desierto de Sonora, M�xico (Sonora)', 2, 2),
    ('Sierra Madre Oriental', 'Bosque dominado por �rboles de con�feras como pino, abeto y cipr�s. Com�n en climas templados y monta�osos.', 'Sierra Madre Oriental, M�xico (Nuevo Le�n, Tamaulipas)', 3, 3),
    ('Sierra Norte de Oaxaca', 'Zona boscosa con presencia constante de nubes y alta humedad. Caracter�stico de zonas monta�osas en climas tropicales.', 'Sierra Norte de Oaxaca, M�xico (Oaxaca)', 4, 4),
    ('Selva Lacandona', 'Bosque con gran diversidad de especies vegetales y animales. Presenta altas precipitaciones y temperaturas c�lidas durante todo el a�o.', 'Selva Lacandona, M�xico (Chiapas)', 1, 5);

INSERT INTO species_threats (specie_id, threat_id) 
VALUES 
    (1, 1), 
    (1, 2), 
    (2, 1), 
    (2, 2),
    (2, 5), 
    (3, 1),
    (3, 2), 
    (3, 3), 
    (3, 5), 
    (4, 1), 
    (4, 3), 
    (4, 4),
    (4, 5), 
    (5, 1), 
    (5, 2), 
    (5, 3),
    (5, 4),
    (5, 5);

	INSERT INTO contact_types (name) 
VALUES 
    ('Tel�fono'),
    ('Correo electr�nico'),
    ('Sitio web'),
    ('Instagram'),
    ('Facebook'),
    ('WhatsApp');

	INSERT INTO associations (name, description, association_type_id) 
VALUES 
    ('Asociaci�n para la Conservaci�n del Lince Rojo', 'Asociaci�n dedicada a la protecci�n y conservaci�n del lince rojo y su h�bitat natural.', 1),
    ('Grupo de Rescate de Tortugas del Desierto', 'Grupo dedicado al rescate, rehabilitaci�n y liberaci�n de tortugas del desierto en peligro de extinci�n.', 2),
    ('Centro de Conservaci�n del Zorro Rojo', 'Centro especializado en la conservaci�n y protecci�n del zorro rojo y sus ecosistemas.', 3),
    ('Fundaci�n Quetzal Vivo', 'Fundaci�n comprometida con la conservaci�n y protecci�n del quetzal y sus bosques nubosos.', 4),
    ('Instituto de Investigaci�n del Tapir Centroamericano', 'Instituto que realiza investigaciones cient�ficas para la conservaci�n del tapir centroamericano y su h�bitat.', 5);

	INSERT INTO contact_information (contact, association_id, contact_type_id) 
VALUES 
    ('555-123-4567', 1, 1),  
    ('contacto@fundacionlince.org', 1, 2), 
    ('www.fundacionlince.org', 1, 3),  
    ('instagram.com/fundacionlince', 1, 4),  
    ('facebook.com/fundacionlince', 1, 5), 
    ('+1 234 567 8901', 1, 6);

	INSERT INTO species_associations (specie_id, association_id) 
VALUES 
    (1, 1), 
    (2, 2), 
    (3, 3), 
    (4, 4), 
    (5, 5);

	INSERT INTO measurement_types (name, description) 
VALUES 
    ('Monitoreo de poblaciones', 'Medici�n y seguimiento de las poblaciones de especies en peligro para evaluar su tama�o y tendencias.'),
    ('Monitoreo de h�bitats', 'Evaluaci�n de los h�bitats naturales de especies en peligro para identificar cambios y amenazas.'),
    ('Evaluaci�n de impacto ambiental', 'An�lisis de los posibles impactos ambientales de proyectos o actividades en �reas sensibles.'),
    ('Monitoreo de contaminantes', 'Seguimiento de la presencia y concentraci�n de contaminantes en el medio ambiente.');

	INSERT INTO impact_assessments (name, description) 
VALUES 
    ('Impacto moderado', 'Evaluaci�n que indica un impacto ambiental moderado en el h�bitat de las especies.'),
    ('Impacto severo', 'Evaluaci�n que indica un impacto ambiental severo en el h�bitat de las especies.'),
    ('Impacto insignificante', 'Evaluaci�n que indica un impacto ambiental insignificante en el h�bitat de las especies.');

	INSERT INTO implementations_status (name, description) 
VALUES 
    ('En progreso', 'Implementaci�n en curso de medidas preventivas o de conservaci�n.'),
    ('Completado', 'Implementaci�n exitosa de medidas preventivas o de conservaci�n.'),
    ('Pendiente', 'Implementaci�n de medidas preventivas o de conservaci�n a�n no iniciada o en espera.');

	INSERT INTO prevention_measures (name, manager, description, start_date, end_date, economic_investment, measurement_type_id, impact_assessment_id, implementation_status_id) 
VALUES 
    ('Restauraci�n de h�bitat', 'Asociaci�n para la Conservaci�n del Lince Rojo', 'Restauraci�n de �reas degradadas para mejorar el h�bitat del lince rojo.', '2023-01-01', '2023-12-31', 50000, 3, 2, 1),
    ('Monitoreo de poblaciones', 'Grupo de Rescate de Tortugas del Desierto', 'Monitoreo regular de la poblaci�n de tortugas del desierto para evaluar su estado y tendencias.', '2023-02-01', '2024-01-31', 30000, 1, 1, 1),
    ('Control de especies invasoras', 'Centro de Conservaci�n del Zorro Rojo', 'Control y erradicaci�n de especies invasoras que compiten con el zorro rojo por recursos.', '2023-03-01', '2024-03-01', 45000, 4, 2, 3),
    ('Educaci�n ambiental', 'Fundaci�n Quetzal Vivo', 'Programas educativos para concienciar a la comunidad sobre la importancia de la conservaci�n del quetzal y su h�bitat.', '2023-04-01', '2023-12-01', 25000, 2, 3, 1);

	INSERT INTO associations_prevention_measures (association_id, prevention_measures_id) 
VALUES 
    (1, 1), 
    (2, 2), 
    (3, 3), 
    (4, 4), 
    (5, 1);

	INSERT INTO roles (name, description) 
VALUES 
    ('Administrador', 'Rol con privilegios para administrar y gestionar la plataforma.'),
    ('Editor', 'Rol con permisos para editar y publicar contenido en la plataforma.');

INSERT INTO users (name, lastname_1, lastname_2, email, password, birthdate, id_roles) 
VALUES 
    ('Jose', 'Martinez', 'Cabrera', 'jose@example.com', 'contrase�a123', '1990-05-15', 1), 
    ('Axel', 'Ramirez', 'Ortizz', 'axel@example.com', 'clave123', '1995-10-21', 2), 
    ('Ivan', 'Morales', 'Flores', 'ivan@example.com', 'password123', '1988-07-08', 2), 
    ('Briseida', 'Garcia', 'Martinez', 'briseida@example.com', 'securepass', '1982-12-30', 2), 
    ('Marcos', 'Hernandez', 'Adrian', 'marcos@example.com', 'password456', '1993-03-25', 2), 
    ('Estrella', 'Torrijos', 'Aguillon', 'estrella@example.com', 'password456', '1993-03-25', 2); 
