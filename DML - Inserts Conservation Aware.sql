INSERT INTO habitat_conservation_status (name, description) 
VALUES 
    ('En peligro crítico', 'Indica que el hábitat enfrenta un riesgo extremadamente alto de extinción debido a la pérdida de hábitat, fragmentación, degradación y otras amenazas significativas.'),
    ('En peligro', 'Sugiere que el hábitat enfrenta un riesgo alto de extinción si las amenazas actuales continúan sin ser abordadas adecuadamente, como la deforestación, la urbanización y la contaminación.'),
    ('Vulnerable', 'Se refiere a hábitats que enfrentan un riesgo moderado de extinción si las amenazas persisten o aumentan, como la sobreexplotación de recursos y el cambio climático.'),
    ('Casi amenazado', 'Indica que el hábitat no cumple los criterios para ser clasificado como en peligro o vulnerable, pero enfrenta un riesgo potencial de extinción si las amenazas continúan.'),
    ('Preocupación menor', 'Se refiere a hábitats que no enfrentan un riesgo significativo de extinción en un futuro cercano, pero aún pueden requerir medidas de conservación para prevenir futuros problemas.');

	INSERT INTO species_conservation_status (name, description) 
VALUES 
    ('En peligro crítico', 'Indica que la especie enfrenta un riesgo extremadamente alto de extinción en la naturaleza debido a la pérdida de hábitat, la caza, la contaminación u otras amenazas significativas.'),
    ('En peligro', 'Sugiere que la especie enfrenta un riesgo alto de extinción en la naturaleza si las amenazas actuales continúan sin ser abordadas adecuadamente, como la degradación del hábitat y el cambio climático.'),
    ('Vulnerable', 'Se refiere a especies que enfrentan un riesgo moderado de extinción en la naturaleza si las amenazas persisten o aumentan, como la sobreexplotación de recursos y la introducción de especies invasoras.'),
    ('Casi amenazado', 'Indica que la especie no cumple los criterios para ser clasificada como en peligro o vulnerable, pero enfrenta un riesgo potencial de extinción si las amenazas continúan.'),
    ('Preocupación menor', 'Se refiere a especies que no enfrentan un riesgo significativo de extinción en un futuro cercano, pero aún pueden requerir medidas de conservación para mantener sus poblaciones estables.');

	INSERT INTO animals (common_name, scientific_name, description, estimated_population) 
VALUES 
    ('Lince', 'Lynx rufus', 'El lince es un felino endémico de México, conocido por su pelaje rojizo y sus característicos mechones en las orejas. Se encuentra en peligro de extinción debido a la pérdida de hábitat y la caza furtiva. Su población se ha reducido drásticamente en las últimas décadas.', 500),
    ('Tortuga', 'Gopherus agassizii', 'La tortuga es una especie de tortuga terrestre endémica de los desiertos del suroeste de los Estados Unidos y el norte de México. Se encuentra en peligro de extinción debido a la degradación de su hábitat, el tráfico ilegal de mascotas y la depredación por parte de animales introducidos.', 1000),
    ('Zorro', 'Vulpes vulpes', 'El zorro es un mamífero carnívoro de la familia Canidae. Algunas de sus especies, como el zorro gris o zorro plateado, se encuentran en peligro de extinción en México debido a la pérdida de hábitat y la caza.', 300),
    ('Quetzal', 'Pharomachrus mocinno', 'El quetzal es un ave emblemática de México, conocida por su colorido plumaje y su importancia cultural en las civilizaciones mesoamericanas. Se encuentra en peligro de extinción debido a la deforestación y la fragmentación de su hábitat, así como a la captura ilegal para el comercio de aves exóticas.', 200),
    ('Tapir', 'Tapirus bairdii', 'El tapir es un mamífero herbívoro que habita en los bosques tropicales y subtropicales de México y Centroamérica. Se encuentra en peligro de extinción debido a la pérdida y degradación de su hábitat, así como a la caza furtiva para obtener su carne y piel.', 500);

INSERT INTO species (scientific_name, description, life_expectancy, animal_id, feeding_id, specie_conservation_status)
VALUES 
    ('Lynx rufus', 'El lince rojo es una especie de felino endémica de América del Norte. Habita principalmente en bosques y zonas montañosas. Su población ha disminuido debido a la pérdida de hábitat y la caza furtiva.', 10, 1, 1, 2),
    ('Gopherus agassizii', 'La tortuga del desierto es una especie de tortuga terrestre que habita en los desiertos del suroeste de los Estados Unidos y el norte de México. Se encuentra en peligro de extinción debido a la destrucción de su hábitat y al comercio ilegal de mascotas.', 50, 2, 2, 1),
    ('Vulpes vulpes', 'El zorro rojo es un mamífero carnívoro de la familia Canidae. Habita en una amplia variedad de hábitats, desde bosques hasta áreas urbanas. Su principal amenaza es la caza y la pérdida de hábitat.', 8, 3, 3, 4),
    ('Quetzal', 'El quetzal es un ave tropical que habita en los bosques nubosos de América Central y México. Es conocido por su plumaje colorido y su importancia cultural para las civilizaciones mesoamericanas. La deforestación es su principal amenaza.', 15, 4, 4, 1),
    ('Tapir', 'El tapir centroamericano es un mamífero herbívoro que habita en los bosques tropicales de México y Centroamérica. Se encuentra en peligro de extinción debido a la pérdida y degradación de su hábitat, así como a la caza furtiva.', 20, 5, 5, 2);

	INSERT INTO habitats (name, description, id_habitat_conservation_status)
VALUES
    ('Bosque de pino-encino', 'Este hábitat se caracteriza por la presencia predominante de árboles de pino y encino, con suelos generalmente ácidos y una amplia diversidad de especies de plantas y animales. Se encuentra en peligro debido a la deforestación y la actividad humana.', 1),
    ('Desierto', 'El desierto es un hábitat árido y seco con suelos arenosos o rocosos y escasa vegetación. Las temperaturas pueden variar ampliamente entre el día y la noche. Este hábitat se encuentra en peligro debido a la degradación del suelo y la urbanización.', 5),
    ('Bosque templado', 'Los bosques templados se caracterizan por una diversidad de árboles caducifolios que pierden sus hojas en otoño. Este hábitat es común en regiones con estaciones distintas y presenta una rica biodiversidad. Está en peligro debido a la deforestación y la expansión urbana.', 3),
    ('Bosque nuboso', 'Los bosques nubosos son ecosistemas húmedos y montañosos cubiertos por nubes la mayor parte del tiempo. La vegetación es densa y diversa, con una gran cantidad de plantas epifitas. Este hábitat se encuentra en peligro debido a la deforestación y el cambio climático.', 4),
    ('Bosque tropical', 'Los bosques tropicales son algunos de los hábitats más biodiversos del mundo, con una gran variedad de especies de árboles, plantas y animales. Estos bosques se caracterizan por su clima cálido y húmedo durante todo el año. Se encuentran en peligro debido a la deforestación y la actividad agrícola.', 1);

	INSERT INTO animals_habitats (animal_id, habitat_id) 
VALUES 
    (1, 1),  
    (2, 2),  
    (3, 3),  
    (4, 4), 
    (5, 5);

	INSERT INTO geographical_location (name, description, location, climate_id, habitat_id) 
VALUES 
    ('Sierra Madre Occidental', 'Bosque con predominancia de árboles de pino y encino. Característico de zonas montañosas en climas templados.', 'Sierra Madre Occidental, México (Chihuahua, Durango, Sinaloa)', 3, 1),
    ('Desierto de Sonora', 'Región con escasa vegetación y precipitación. Condiciones extremas de temperatura y aridez.', 'Desierto de Sonora, México (Sonora)', 2, 2),
    ('Sierra Madre Oriental', 'Bosque dominado por árboles de coníferas como pino, abeto y ciprés. Común en climas templados y montañosos.', 'Sierra Madre Oriental, México (Nuevo León, Tamaulipas)', 3, 3),
    ('Sierra Norte de Oaxaca', 'Zona boscosa con presencia constante de nubes y alta humedad. Característico de zonas montañosas en climas tropicales.', 'Sierra Norte de Oaxaca, México (Oaxaca)', 4, 4),
    ('Selva Lacandona', 'Bosque con gran diversidad de especies vegetales y animales. Presenta altas precipitaciones y temperaturas cálidas durante todo el año.', 'Selva Lacandona, México (Chiapas)', 1, 5);

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
    ('Teléfono'),
    ('Correo electrónico'),
    ('Sitio web'),
    ('Instagram'),
    ('Facebook'),
    ('WhatsApp');

	INSERT INTO associations (name, description, association_type_id) 
VALUES 
    ('Asociación para la Conservación del Lince Rojo', 'Asociación dedicada a la protección y conservación del lince rojo y su hábitat natural.', 1),
    ('Grupo de Rescate de Tortugas del Desierto', 'Grupo dedicado al rescate, rehabilitación y liberación de tortugas del desierto en peligro de extinción.', 2),
    ('Centro de Conservación del Zorro Rojo', 'Centro especializado en la conservación y protección del zorro rojo y sus ecosistemas.', 3),
    ('Fundación Quetzal Vivo', 'Fundación comprometida con la conservación y protección del quetzal y sus bosques nubosos.', 4),
    ('Instituto de Investigación del Tapir Centroamericano', 'Instituto que realiza investigaciones científicas para la conservación del tapir centroamericano y su hábitat.', 5);

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
    ('Monitoreo de poblaciones', 'Medición y seguimiento de las poblaciones de especies en peligro para evaluar su tamaño y tendencias.'),
    ('Monitoreo de hábitats', 'Evaluación de los hábitats naturales de especies en peligro para identificar cambios y amenazas.'),
    ('Evaluación de impacto ambiental', 'Análisis de los posibles impactos ambientales de proyectos o actividades en áreas sensibles.'),
    ('Monitoreo de contaminantes', 'Seguimiento de la presencia y concentración de contaminantes en el medio ambiente.');

	INSERT INTO impact_assessments (name, description) 
VALUES 
    ('Impacto moderado', 'Evaluación que indica un impacto ambiental moderado en el hábitat de las especies.'),
    ('Impacto severo', 'Evaluación que indica un impacto ambiental severo en el hábitat de las especies.'),
    ('Impacto insignificante', 'Evaluación que indica un impacto ambiental insignificante en el hábitat de las especies.');

	INSERT INTO implementations_status (name, description) 
VALUES 
    ('En progreso', 'Implementación en curso de medidas preventivas o de conservación.'),
    ('Completado', 'Implementación exitosa de medidas preventivas o de conservación.'),
    ('Pendiente', 'Implementación de medidas preventivas o de conservación aún no iniciada o en espera.');

	INSERT INTO prevention_measures (name, manager, description, start_date, end_date, economic_investment, measurement_type_id, impact_assessment_id, implementation_status_id) 
VALUES 
    ('Restauración de hábitat', 'Asociación para la Conservación del Lince Rojo', 'Restauración de áreas degradadas para mejorar el hábitat del lince rojo.', '2023-01-01', '2023-12-31', 50000, 3, 2, 1),
    ('Monitoreo de poblaciones', 'Grupo de Rescate de Tortugas del Desierto', 'Monitoreo regular de la población de tortugas del desierto para evaluar su estado y tendencias.', '2023-02-01', '2024-01-31', 30000, 1, 1, 1),
    ('Control de especies invasoras', 'Centro de Conservación del Zorro Rojo', 'Control y erradicación de especies invasoras que compiten con el zorro rojo por recursos.', '2023-03-01', '2024-03-01', 45000, 4, 2, 3),
    ('Educación ambiental', 'Fundación Quetzal Vivo', 'Programas educativos para concienciar a la comunidad sobre la importancia de la conservación del quetzal y su hábitat.', '2023-04-01', '2023-12-01', 25000, 2, 3, 1);

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
    ('Jose', 'Martinez', 'Cabrera', 'jose@example.com', 'contraseña123', '1990-05-15', 1), 
    ('Axel', 'Ramirez', 'Ortizz', 'axel@example.com', 'clave123', '1995-10-21', 2), 
    ('Ivan', 'Morales', 'Flores', 'ivan@example.com', 'password123', '1988-07-08', 2), 
    ('Briseida', 'Garcia', 'Martinez', 'briseida@example.com', 'securepass', '1982-12-30', 2), 
    ('Marcos', 'Hernandez', 'Adrian', 'marcos@example.com', 'password456', '1993-03-25', 2), 
    ('Estrella', 'Torrijos', 'Aguillon', 'estrella@example.com', 'password456', '1993-03-25', 2); 
