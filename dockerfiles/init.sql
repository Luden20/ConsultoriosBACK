-- drop database consultoriosjuridicos;
-- create database consultoriosjuridicos;
-- use consultoriosjuridicos;
SHOW TABLES;

SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;

/* Clean existing catalog tables (child tables first to respect FK constraints) */
DROP TABLE IF EXISTS Number_Of_Attempts;
DROP TABLE IF EXISTS Vulnerable_Situations;
DROP TABLE IF EXISTS Field_Of_Activities;
DROP TABLE IF EXISTS Type_Of_Activities;
DROP TABLE IF EXISTS Type_Of_Housings;
DROP TABLE IF EXISTS Type_Of_Attentions;
DROP TABLE IF EXISTS Topics;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Protocols;
DROP TABLE IF EXISTS Profiles;
DROP TABLE IF EXISTS Pensioners;
DROP TABLE IF EXISTS Own_Assets;
DROP TABLE IF EXISTS Occupations;
DROP TABLE IF EXISTS Income_Levels;
DROP TABLE IF EXISTS Health_Insurances;
DROP TABLE IF EXISTS Family_Incomes;
DROP TABLE IF EXISTS Family_Groups;
DROP TABLE IF EXISTS Ethnicities;
DROP TABLE IF EXISTS Disabilities;
DROP TABLE IF EXISTS Derived_Bies;
DROP TABLE IF EXISTS Complexities;
DROP TABLE IF EXISTS Client_Types;
DROP TABLE IF EXISTS Civil_Statuses;
DROP TABLE IF EXISTS Catastrophic_Illnesses;
DROP TABLE IF EXISTS Case_Statuses;
DROP TABLE IF EXISTS Academic_Instructions;
DROP TABLE IF EXISTS Sexes;
DROP TABLE IF EXISTS Sectors;
DROP TABLE IF EXISTS Zones;
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Provinces;
DROP TABLE IF EXISTS countries;

/* Ensure schema exists before loading catalog data (parents before children) */
CREATE TABLE IF NOT EXISTS countries (
    Country_ID INT AUTO_INCREMENT PRIMARY KEY,
    Country_Name VARCHAR(255) NOT NULL,
    Country_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Provinces (
    Province_ID INT AUTO_INCREMENT PRIMARY KEY,
    Province_Name VARCHAR(255) NOT NULL,
    Province_Status TINYINT(1) NOT NULL DEFAULT 1,
    Country_FK INT NOT NULL,
    CONSTRAINT fk_provinces_countries FOREIGN KEY (Country_FK) REFERENCES countries (Country_ID)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Cities (
    City_ID INT AUTO_INCREMENT PRIMARY KEY,
    City_Name VARCHAR(255) NOT NULL,
    City_Status TINYINT(1) NOT NULL DEFAULT 1,
    Province_FK INT NOT NULL,
    CONSTRAINT fk_cities_provinces FOREIGN KEY (Province_FK) REFERENCES Provinces (Province_ID)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Zones (
    Zone_ID INT AUTO_INCREMENT PRIMARY KEY,
    Zone_Name VARCHAR(255) NOT NULL,
    Zone_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Sectors (
    Sector_ID INT AUTO_INCREMENT PRIMARY KEY,
    Sector_Name VARCHAR(255) NOT NULL,
    Sector_Status TINYINT(1) NOT NULL DEFAULT 1,
    Zone_FK INT NOT NULL,
    CONSTRAINT fk_sectors_zones FOREIGN KEY (Zone_FK) REFERENCES Zones (Zone_ID)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Sexes (
    Sex_ID INT AUTO_INCREMENT PRIMARY KEY,
    Sex_Name VARCHAR(100) NOT NULL,
    Sex_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Academic_Instructions (
    Academic_Instruction_ID INT AUTO_INCREMENT PRIMARY KEY,
    Academic_Instruction_Name VARCHAR(255) NOT NULL,
    Academic_Instruction_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Case_Statuses (
    Case_Status_ID INT AUTO_INCREMENT PRIMARY KEY,
    Case_Status_Name VARCHAR(255) NOT NULL,
    Case_Status_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Catastrophic_Illnesses (
    Catastrophic_Illness_ID INT AUTO_INCREMENT PRIMARY KEY,
    Catastrophic_Illness_Name VARCHAR(255) NOT NULL,
    Catastrophic_Illness_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Civil_Statuses (
    Civil_Status_ID INT AUTO_INCREMENT PRIMARY KEY,
    Civil_Status_Name VARCHAR(255) NOT NULL,
    Civil_Status_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Client_Types (
    Client_Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Client_Type_Name VARCHAR(255) NOT NULL,
    Client_Type_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Complexities (
    Complexity_ID INT AUTO_INCREMENT PRIMARY KEY,
    Complexity_Name VARCHAR(255) NOT NULL,
    Complexity_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Derived_Bies (
    Derived_By_ID INT AUTO_INCREMENT PRIMARY KEY,
    Derived_By_Name VARCHAR(255) NOT NULL,
    Derived_By_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Disabilities (
    Disability_ID INT AUTO_INCREMENT PRIMARY KEY,
    Disability_Name VARCHAR(255) NOT NULL,
    Disability_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Ethnicities (
    Ethnicity_ID INT AUTO_INCREMENT PRIMARY KEY,
    Ethnicity_Name VARCHAR(255) NOT NULL,
    Ethnicity_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Family_Groups (
    Family_Group_ID INT AUTO_INCREMENT PRIMARY KEY,
    Family_Group_Name VARCHAR(255) NOT NULL,
    Family_Group_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Family_Incomes (
    Family_Income_ID INT AUTO_INCREMENT PRIMARY KEY,
    Family_Income_Name VARCHAR(255) NOT NULL,
    Family_Income_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Health_Insurances (
    Health_Insurance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Health_Insurance_Name VARCHAR(255) NOT NULL,
    Health_Insurance_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Income_Levels (
    Income_Level_ID INT AUTO_INCREMENT PRIMARY KEY,
    Income_Level_Name VARCHAR(255) NOT NULL,
    Income_Level_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Occupations (
    Occupation_ID INT AUTO_INCREMENT PRIMARY KEY,
    Occupation_Name VARCHAR(255) NOT NULL,
    Occupation_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Own_Assets (
    Own_Assets_ID INT AUTO_INCREMENT PRIMARY KEY,
    Own_Assets_Name VARCHAR(255) NOT NULL,
    Own_Assets_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Pensioners (
    Pensioner_ID INT AUTO_INCREMENT PRIMARY KEY,
    Pensioner_Name VARCHAR(255) NOT NULL,
    Pensioner_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Profiles (
    Profile_ID INT AUTO_INCREMENT PRIMARY KEY,
    Profile_Name VARCHAR(255) NOT NULL,
    Profile_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Protocols (
    Protocol_ID INT AUTO_INCREMENT PRIMARY KEY,
    Protocol_Name VARCHAR(255) NOT NULL,
    Protocol_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Subjects (
    Subject_ID INT AUTO_INCREMENT PRIMARY KEY,
    Subject_Name VARCHAR(255) NOT NULL,
    Subject_NRC VARCHAR(100) NOT NULL,
    Subject_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Topics (
    Topic_ID INT AUTO_INCREMENT PRIMARY KEY,
    Topic_Name VARCHAR(255) NOT NULL,
    Subject_FK INT NOT NULL,
    Topic_Status TINYINT(1) NOT NULL DEFAULT 1,
    CONSTRAINT fk_topics_subjects FOREIGN KEY (Subject_FK) REFERENCES Subjects (Subject_ID)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Type_Of_Attentions (
    Type_Of_Attention_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Of_Attention_Name VARCHAR(255) NOT NULL,
    Type_Of_Attention_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Type_Of_Housings (
    Type_Of_Housing_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Of_Housing_Name VARCHAR(255) NOT NULL,
    Type_Of_Housing_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Type_Of_Activities (
    Type_Of_Activity_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Of_Activity_Name VARCHAR(255) NOT NULL,
    Type_Of_Activity_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Field_Of_Activities (
    Field_Of_Activity_ID INT AUTO_INCREMENT PRIMARY KEY,
    Field_Of_Activity_Name VARCHAR(255) NOT NULL,
    Field_Of_Activity_Type VARCHAR(100) NOT NULL,
    Type_Of_Activity_FK INT NOT NULL,
    Field_Of_Activity_Status TINYINT(1) NOT NULL DEFAULT 1,
    CONSTRAINT fk_field_activities_type FOREIGN KEY (Type_Of_Activity_FK) REFERENCES Type_Of_Activities (Type_Of_Activity_ID)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Vulnerable_Situations (
    Vulnerable_Situation_ID INT AUTO_INCREMENT PRIMARY KEY,
    Vulnerable_Situation_Name VARCHAR(255) NOT NULL,
    Vulnerable_Situation_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS Number_Of_Attempts (
    Number_Of_Attempts_ID INT AUTO_INCREMENT PRIMARY KEY,
    Number_Of_Attempts INT NOT NULL,
    Number_Of_Attempts_Status TINYINT(1) NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

INSERT INTO countries (Country_Name, Country_Status) VALUES
                                                         ('Ecuador', true),
                                                         ('Afganistán', true),
                                                         ('Albania', true),
                                                         ('Alemania', true),
                                                         ('Andorra', true),
                                                         ('Angola', true),
                                                         ('Antigua y Barbuda', true),
                                                         ('Arabia Saudita', true),
                                                         ('Argelia', true),
                                                         ('Argentina', true),
                                                         ('Armenia', true),
                                                         ('Aruba', true),
                                                         ('Australia', true),
                                                         ('Austria', true),
                                                         ('Azerbaiyán', true),

                                                         ('Bahamas', true),
                                                         ('Baréin', true),
                                                         ('Bangladesh', true),
                                                         ('Barbados', true),
                                                         ('Bielorrusia', true),
                                                         ('Bélgica', true),
                                                         ('Belice', true),
                                                         ('Bermudas', true),
                                                         ('Birmania', true),
                                                         ('Bután', true),
                                                         ('Bolivia', true),
                                                         ('Bosnia y Herzegovina', true),
                                                         ('Botsuana', true),
                                                         ('Brasil', true),
                                                         ('Brunéi', true),
                                                         ('Bulgaria', true),
                                                         ('Burkina Faso', true),
                                                         ('Burundi', true),

                                                         ('Cabo Verde', true),
                                                         ('Camboya', true),
                                                         ('Camerún', true),
                                                         ('Canadá', true),
                                                         ('Catar', true),
                                                         ('Chad', true),
                                                         ('Chile', true),
                                                         ('China', true),
                                                         ('Chipre', true),
                                                         ('Colombia', true),
                                                         ('Comoras', true),
                                                         ('Costa de Marfil', true),
                                                         ('Costa Rica', true),
                                                         ('Croacia', true),
                                                         ('Cuba', true),
                                                         ('Curazao', true),

                                                         ('Dinamarca', true),
                                                         ('Dominica', true),
                                                         ('República Dominicana', true),


                                                         ('Egipto', true),
                                                         ('El Salvador', true),
                                                         ('Emiratos Árabes Unidos', true),
                                                         ('Eritrea', true),
                                                         ('Eslovaquia', true),
                                                         ('Eslovenia', true),
                                                         ('España', true),
                                                         ('Estados Unidos', true),
                                                         ('Estonia', true),
                                                         ('Esuatini', true),
                                                         ('Etiopía', true),

                                                         ('Filipinas', true),
                                                         ('Finlandia', true),
                                                         ('Francia', true),

                                                         ('Gabón', true),
                                                         ('Gambia', true),
                                                         ('Georgia', true),
                                                         ('Ghana', true),
                                                         ('Granada', true),
                                                         ('Guatemala', true),
                                                         ('Guayana', true),
                                                         ('Guinea', true),
                                                         ('Guinea-Bisáu', true),
                                                         ('Guinea Ecuatorial', true),

                                                         ('Haití', true),
                                                         ('Honduras', true),
                                                         ('Hungría', true),

                                                         ('India', true),
                                                         ('Indonesia', true),
                                                         ('Inglaterra', true),
                                                         ('Irán', true),
                                                         ('Irak', true),
                                                         ('Irlanda', true),
                                                         ('Islandia', true),
                                                         ('Israel', true),
                                                         ('Italia', true),

                                                         ('Jamaica', true),
                                                         ('Japón', true),
                                                         ('Jordania', true),

                                                         ('Kazajistán', true),
                                                         ('Kenia', true),
                                                         ('Kirguistán', true),
                                                         ('Kiribati', true),
                                                         ('Corea del Norte', true),
                                                         ('Corea del Sur', true),
                                                         ('Kuwait', true),

                                                         ('Laos', true),
                                                         ('Letonia', true),
                                                         ('Líbano', true),
                                                         ('Liberia', true),
                                                         ('Libia', true),
                                                         ('Liechtenstein', true),
                                                         ('Lituania', true),
                                                         ('Luxemburgo', true),

                                                         ('Macedonia del Norte', true),
                                                         ('Madagascar', true),
                                                         ('Malaui', true),
                                                         ('Malasia', true),
                                                         ('Maldivas', true),
                                                         ('Malí', true),
                                                         ('Malta', true),
                                                         ('Islas Marshall', true),
                                                         ('Mauritania', true),
                                                         ('Mauricio', true),
                                                         ('México', true),
                                                         ('Micronesia', true),
                                                         ('Moldavia', true),
                                                         ('Mónaco', true),
                                                         ('Mongolia', true),
                                                         ('Montenegro', true),
                                                         ('Marruecos', true),
                                                         ('Mozambique', true),

                                                         ('Namibia', true),
                                                         ('Nauru', true),
                                                         ('Nepal', true),
                                                         ('Países Bajos', true),
                                                         ('Nueva Zelanda', true),
                                                         ('Nicaragua', true),
                                                         ('Níger', true),
                                                         ('Nigeria', true),

                                                         ('Isla de Man', true),
                                                         ('Noruega', true),

                                                         ('Omán', true),

                                                         ('Pakistán', true),
                                                         ('Palaos', true),
                                                         ('Palestina', true),
                                                         ('Panamá', true),
                                                         ('Papúa Nueva Guinea', true),
                                                         ('Paraguay', true),
                                                         ('Perú', true),
                                                         ('Polonia', true),
                                                         ('Portugal', true),

                                                         ('Ruanda', true),

                                                         ('Rumania', true),
                                                         ('Rusia', true),

                                                         ('San Cristóbal y Nieves', true),
                                                         ('Santa Lucía', true),
                                                         ('San Vicente y las Granadinas', true),
                                                         ('San Marino', true),
                                                         ('Santo Tomé y Príncipe', true),
                                                         ('Senegal', true),
                                                         ('Serbia', true),
                                                         ('Seychelles', true),
                                                         ('Sierra Leona', true),
                                                         ('Singapur', true),
                                                         ('Siria', true),
                                                         ('Somalia', true),
                                                         ('Sudáfrica', true),
                                                         ('Sudán', true),
                                                         ('Sudán del Sur', true),
                                                         ('Suecia', true),
                                                         ('Suiza', true),

                                                         ('Surinam', true),

                                                         ('Tailandia', true),
                                                         ('Tanzania', true),
                                                         ('Timor Oriental', true),
                                                         ('Togo', true),
                                                         ('Tonga', true),
                                                         ('Trinidad y Tobago', true),
                                                         ('Túnez', true),
                                                         ('Turkmenistán', true),
                                                         ('Turquía', true),
                                                         ('Tuvalu', true),

                                                         ('Uganda', true),
                                                         ('Ucrania', true),
                                                         ('Uruguay', true),
                                                         ('Uzbekistán', true),

                                                         ('Vanuatu', true),
                                                         ('Ciudad del Vaticano', true),
                                                         ('Venezuela', true),
                                                         ('Vietnam', true),

                                                         ('Islas Vírgenes Británicas', true),
                                                         ('Islas Vírgenes de los Estados Unidos', true),

                                                         ('Wallis y Futuna', true),

                                                         ('Yemen', true),

                                                         ('Zambia', true),
                                                         ('Zimbabue', true);

/******************************************Zona*****************************************************************************/

INSERT INTO Zones (Zone_Name, Zone_Status) VALUES
                                               ('Urbana', true),
                                               ('Rural', true),
                                               ('Frontera', true);



/******************************************Sector*****************************************************************************/

-- Insertar los sectores
INSERT INTO Sectors (Sector_Name, Sector_Status, Zone_FK) VALUES
                                                              ('Belisario Quevedo', true, 1),
                                                              ('Carcelén', true, 1),
                                                              ('Centro Histórico', true, 1),
                                                              ('Chilibulo', true, 1),
                                                              ('Chillogallo', true, 1),
                                                              ('Chimbacalle', true, 1),
                                                              ('Cochapamba', true, 1),
                                                              ('Comité del Pueblo', true, 1),
                                                              ('Concepción', true, 1),
                                                              ('Cotocollao', true, 1),
                                                              ('El Condado', true, 1),
                                                              ('El Inca', true, 1),
                                                              ('Guamaní', true, 1),
                                                              ('Iñaquito', true, 1),
                                                              ('Itchimbía', true, 1),
                                                              ('Jipijapa', true, 1),
                                                              ('Kennedy', true, 1),
                                                              ('La Argelia', true, 1),
                                                              ('La Ecuatoriana', true, 1),
                                                              ('La Ferroviaria', true, 1),
                                                              ('La Libertad', true, 1),
                                                              ('La Mena', true, 1),
                                                              ('Magdalena', true, 1),
                                                              ('Mariscal Sucre', true, 1),
                                                              ('Ponceano', true, 1),
                                                              ('Puengasí', true, 1),
                                                              ('Quitumbe', true, 1),
                                                              ('Rumipamba', true, 1),
                                                              ('San Bartolo', true, 1),
                                                              ('San Juan', true, 1),
                                                              ('Solanda', true, 1),
                                                              ('Turubamba', true, 1);




INSERT INTO Sectors (Sector_Name, Sector_Status, Zone_FK) VALUES
                                                              ('Alangasí', true, 2),
                                                              ('Amaguaña', true, 2),
                                                              ('Atahualpa', true, 2),
                                                              ('Calacalí', true, 2),
                                                              ('Calderón', true, 2),
                                                              ('Chavezpamba', true, 2),
                                                              ('Checa', true, 2),
                                                              ('Cumbayá', true, 2),
                                                              ('Gualea', true, 2),
                                                              ('Guangopolo', true, 2),
                                                              ('Guayllabamba', true, 2),
                                                              ('Llano Chico', true, 2),
                                                              ('Lloa', true, 2),
                                                              ('La Merced', true, 2),
                                                              ('Nanegal', true, 2),
                                                              ('Nanegalito', true, 2),
                                                              ('Nayón', true, 2),
                                                              ('Nono', true, 2),
                                                              ('Pacto', true, 2),
                                                              ('Perucho', true, 2),
                                                              ('Pifo', true, 2),
                                                              ('Píntag', true, 2),
                                                              ('Pomasqui', true, 2),
                                                              ('Puéllaro', true, 2),
                                                              ('Puembo', true, 2),
                                                              ('El Quinche', true, 2),
                                                              ('San Antonio de Pichincha', true, 2),
                                                              ('San José de Minas', true, 2),
                                                              ('Tababela', true, 2),
                                                              ('Tumbaco', true, 2),
                                                              ('Yaruquí', true, 2),
                                                              ('Zámbiza', true, 2);

/******************************************PROVINCIA*************************************************************************/
INSERT INTO Provinces (Province_Name, Province_Status, Country_FK) VALUES
                                                                       ('Azuay', true, 1),
                                                                       ('Bolívar', true, 1),
                                                                       ('Cañar', true, 1),
                                                                       ('Carchi', true, 1),
                                                                       ('Chimborazo', true, 1),
                                                                       ('Cotopaxi', true, 1),
                                                                       ('El oro', true, 1),
                                                                       ('Esmeraldas', true, 1),
                                                                       ('Galápagos', true, 1),
                                                                       ('Guayas', true, 1),
                                                                       ('Imbabura', true, 1),
                                                                       ('Loja', true, 1),
                                                                       ('Los ríos', true, 1),
                                                                       ('Manabí', true, 1),
                                                                       ('Morona Santiago', true, 1),
                                                                       ('Napo', true, 1),
                                                                       ('Orellana', true, 1),
                                                                       ('Pastaza', true, 1),
                                                                       ('Pichincha', true, 1),
                                                                       ('Santa elena', true, 1),
                                                                       ('Santo domingo de los Tsáchilas', true, 1),
                                                                       ('Sucumbíos', true, 1),
                                                                       ('Tungurahua', true, 1),
                                                                       ('Zamora Chinchipe', true, 1);

/*****************************************CITY****************************************************************************/
INSERT INTO Cities (City_Name, City_Status, Province_FK) VALUES
                                                             ('28 de Mayo (San Jose de Yacuambi)', true, 24), -- Zamora Chinchipe
                                                             ('Alamor', true, 12), -- Loja
                                                             ('Alausi', true, 5), -- Chimborazo
                                                             ('Alfredo Baquerizo Moreno (Jujan)', true, 10), -- Guayas
                                                             ('Amaluza', true, 24), -- Zamora Chinchipe
                                                             ('Ambato', true, 23), -- Tungurahua
                                                             ('Arajuno', true, 18), -- Pastaza
                                                             ('Archidona', true, 16), -- Napo
                                                             ('Arenillas', true, 7), -- El Oro
                                                             ('Atacames', true, 8), -- Esmeraldas
                                                             ('Atuntaqui', true, 11), -- Imbabura
                                                             ('Azogues', true, 3), -- Cañar
                                                             ('Baba', true, 13), -- Los Ríos
                                                             ('Babahoyo', true, 13), -- Los Ríos
                                                             ('Baeza', true, 16), -- Napo
                                                             ('Bahia de Caraquez', true, 14), -- Manabí
                                                             ('Balao', true, 10), -- Guayas
                                                             ('Balsas', true, 7), -- El Oro
                                                             ('Balzar', true, 10), -- Guayas
                                                             ('Baños de Agua Santa', true, 23), -- Tungurahua
                                                             ('Biblián', true, 3), -- Cañar
                                                             ('Bolívar', true, 7), -- El Oro
                                                             ('Calceta', true, 14), -- Manabí
                                                             ('Caluma', true, 2), -- Bolívar
                                                             ('Camilo Ponce Enriquez', true, 7), -- El Oro
                                                             ('Cañar', true, 3), -- Cañar
                                                             ('Cariamanga', true, 12), -- Loja
                                                             ('Carlos Julio Arosemena Tola', true, 16), -- Napo
                                                             ('Catacocha', true, 12), -- Loja
                                                             ('Catamayo', true, 12), -- Loja
                                                             ('Catamayo (La Toma)', true, 12), -- Loja
                                                             ('Catarama', true, 13), -- Los Ríos
                                                             ('Cayambe', true, 19), -- Pichincha
                                                             ('Celica', true, 12), -- Loja
                                                             ('Cevallos', true, 23), -- Tungurahua
                                                             ('Chaguarpamba', true, 12), -- Loja
                                                             ('Chambo', true, 5), -- Chimborazo
                                                             ('Chilla', true, 7), -- El Oro
                                                             ('Chillanes', true, 2), -- Bolívar
                                                             ('Chone', true, 14), -- Manabí
                                                             ('Chordeleg', true, 1), -- Azuay
                                                             ('Chunchi', true, 5), -- Chimborazo
                                                             ('Colimes', true, 10), -- Guayas
                                                             ('Coronel Marcelino Maridueña (San Carlos)', true, 10), -- Guayas
                                                             ('Cotacachi', true, 11), -- Imbabura
                                                             ('Cuenca', true, 1), -- Azuay
                                                             ('Cumandá', true, 5), -- Chimborazo
                                                             ('Daule', true, 10), -- Guayas
                                                             ('Déleg', true, 3), -- Cañar
                                                             ('Echeandía', true, 2), -- Bolívar
                                                             ('El Ángel', true, 4), -- Carchi
                                                             ('El Carmen', true, 14), -- Manabí
                                                             ('El Chaco', true, 16), -- Napo
                                                             ('El Corazón', true, 2), -- Bolívar
                                                             ('El Dorado de Cascales', true, 22), -- Sucumbíos
                                                             ('El Guabo', true, 7), -- El Oro
                                                             ('El Pan', true, 1), -- Azuay
                                                             ('El Pangui', true, 24), -- Zamora Chinchipe
                                                             ('El Salitre (Las Ramas)', true, 10), -- Guayas
                                                             ('El Tambo', true, 3), -- Cañar
                                                             ('El Triunfo', true, 10), -- Guayas
                                                             ('Eloy Alfaro (Durán)', true, 10), -- Guayas
                                                             ('Esmeraldas', true, 8), -- Esmeraldas
                                                             ('Flavio Alfaro', true, 14), -- Manabí
                                                             ('General Antonio Elizalde (Bucay)', true, 2), -- Bolívar
                                                             ('General Leonidas Plaza Gutierrez (Limón)', true, 15), -- Morona Santiago
                                                             ('General Villamil (Playas)', true, 10), -- Guayas
                                                             ('Girón', true, 1), -- Azuay
                                                             ('Gonzanamá', true, 12), -- Loja
                                                             ('Guachapala', true, 1), -- Azuay
                                                             ('Gualaceo', true, 1), -- Azuay
                                                             ('Gualaquiza', true, 15), -- Morona Santiago
                                                             ('Guamote', true, 5), -- Chimborazo
                                                             ('Guano', true, 5), -- Chimborazo
                                                             ('Guaranda', true, 2), -- Bolívar
                                                             ('Guayaquil', true, 10), -- Guayas
                                                             ('Guayzimi', true, 24), -- Zamora Chinchipe
                                                             ('Huaca', true, 4), -- Carchi
                                                             ('Huamboya', true, 15), -- Morona Santiago
                                                             ('Huaquillas', true, 7), -- El Oro
                                                             ('Isidro Ayora', true, 10), -- Guayas
                                                             ('Jama', true, 14), -- Manabí
                                                             ('Jaramijó', true, 14), -- Manabí
                                                             ('Jipijapa', true, 14), -- Manabí
                                                             ('Junín', true, 14), -- Manabí
                                                             ('La Bonita', true, 22), -- Sucumbíos
                                                             ('La Concordia', true, 21), -- Santo Domingo de los Tsáchilas
                                                             ('La Joya de los Sachas', true, 17), -- Orellana
                                                             ('La Libertad', true, 20), -- Santa Elena
                                                             ('La Maná', true, 6), -- Cotopaxi
                                                             ('La Troncal', true, 3), -- Cañar
                                                             ('La Victoria', true, 6), -- Cotopaxi
                                                             ('Las Naves', true, 2), -- Bolívar
                                                             ('Latacunga', true, 6), -- Cotopaxi
                                                             ('Logroño', true, 15), -- Morona Santiago
                                                             ('Loja', true, 12), -- Loja
                                                             ('Lomas de Sargentillo', true, 10), -- Guayas
                                                             ('Loreto', true, 16), -- Napo
                                                             ('Macará', true, 12), -- Loja
                                                             ('Macas', true, 15), -- Morona Santiago
                                                             ('Machachi', true, 19), -- Pichincha
                                                             ('Machala', true, 7), -- El Oro
                                                             ('Manta', true, 14), -- Manabí
                                                             ('Marcabelí', true, 7), -- El Oro
                                                             ('Mera', true, 18), -- Pastaza
                                                             ('Milagro', true, 10), -- Guayas
                                                             ('Mira (Chontahuasi)', true, 4), -- Carchi
                                                             ('Mocache', true, 13), -- Los Ríos
                                                             ('Mocha', true, 23), -- Tungurahua
                                                             ('Montalvo', true, 13), -- Los Ríos
                                                             ('Montecristi', true, 14), -- Manabí
                                                             ('Muisne', true, 8), -- Esmeraldas
                                                             ('Nabón', true, 1), -- Azuay
                                                             ('Naranjal', true, 10), -- Guayas
                                                             ('Naranjito', true, 10), -- Guayas
                                                             ('Narcisa de Jesús', true, 10), -- Guayas
                                                             ('Nueva Loja', true, 22), -- Sucumbíos
                                                             ('Nuevo Rocafuerte', true, 17), -- Orellana
                                                             ('Olmedo', true, 14), -- Manabí
                                                             ('Otavalo', true, 11), -- Imbabura
                                                             ('Pablo Sexto', true, 15), -- Morona Santiago
                                                             ('Paccha', true, 1), -- Azuay
                                                             ('Paján', true, 14), -- Manabí
                                                             ('Palanda', true, 24), -- Zamora Chinchipe
                                                             ('Palenque', true, 13), -- Los Ríos
                                                             ('Palestina', true, 10), -- Guayas
                                                             ('Pallatanga', true, 5), -- Chimborazo
                                                             ('Palora (Metzera)', true, 15), -- Morona Santiago
                                                             ('Paquisha', true, 24), -- Zamora Chinchipe
                                                             ('Pasaje', true, 7), -- El Oro
                                                             ('Patate', true, 23), -- Tungurahua
                                                             ('Paute', true, 1), -- Azuay
                                                             ('Pedernales', true, 14), -- Manabí
                                                             ('Pedro Carbo', true, 10), -- Guayas
                                                             ('Pedro Vicente Maldonado', true, 19), -- Pichincha
                                                             ('Pelileo', true, 23), -- Tungurahua
                                                             ('Penipe', true, 5), -- Chimborazo
                                                             ('Pichincha', true, 2), -- Bolívar
                                                             ('Píllaro', true, 23), -- Tungurahua
                                                             ('Pimampiro', true, 11), -- Imbabura
                                                             ('Pindal', true, 12), -- Loja
                                                             ('Piñas', true, 7), -- El Oro
                                                             ('Portovelo', true, 7), -- El Oro
                                                             ('Portoviejo', true, 14), -- Manabí
                                                             ('Pucará', true, 1), -- Azuay
                                                             ('Puebloviejo', true, 13), -- Los Ríos
                                                             ('Puerto Ayora', true, 9), -- Galápagos
                                                             ('Puerto Baquerizo Moreno', true, 9), -- Galápagos
                                                             ('Puerto El Carmen del Putumayo', true, 22), -- Sucumbíos
                                                             ('Puerto Francisco de Orellana (El Coca)', true, 17), -- Orellana
                                                             ('Puerto López', true, 14), -- Manabí
                                                             ('Puerto Quito', true, 19), -- Pichincha
                                                             ('Puerto Villamil', true, 9), -- Galápagos
                                                             ('Pujilí', true, 6), -- Cotopaxi
                                                             ('Puyo', true, 18), -- Pastaza
                                                             ('Quero', true, 23), -- Tungurahua
                                                             ('Quevedo', true, 13), -- Los Ríos
                                                             ('Quilanga', true, 12), -- Loja
                                                             ('Quinsaloma', true, 13), -- Los Ríos
                                                             ('Quito', true, 19), -- Pichincha
                                                             ('Riobamba', true, 5), -- Chimborazo
                                                             ('Rioverde', true, 8), -- Esmeraldas
                                                             ('Rocafuerte', true, 14), -- Manabí
                                                             ('Rosa Zárate (Quinindé)', true, 8), -- Esmeraldas
                                                             ('Salinas', true, 20), -- Santa Elena
                                                             ('Samborondón', true, 10), -- Guayas
                                                             ('San Felipe de Oña', true, 1), -- Azuay
                                                             ('San Fernando', true, 1), -- Azuay
                                                             ('San Gabriel', true, 4), -- Carchi
                                                             ('San Jacinto de Buena Fe', true, 13), -- Los Ríos
                                                             ('San Jacinto de Yaguachi', true, 10), -- Guayas
                                                             ('San José de Chimbo', true, 2), -- Bolívar
                                                             ('San Juan Bosco', true, 15), -- Morona Santiago
                                                             ('San Lorenzo', true, 8), -- Esmeraldas
                                                             ('San Miguel', true, 2), -- Bolívar
                                                             ('San Miguel de Ibarra', true, 11), -- Imbabura
                                                             ('San Miguel de los Bancos', true, 19), -- Pichincha
                                                             ('San Miguel de Salcedo', true, 6), -- Cotopaxi
                                                             ('San Vicente', true, 14), -- Manabí
                                                             ('Sangolquí', true, 19), -- Pichincha
                                                             ('Santa Ana de Vuelta Larga', true, 14), -- Manabí
                                                             ('Santa Clara', true, 18), -- Pastaza
                                                             ('Santa Elena', true, 20), -- Santa Elena
                                                             ('Santa Isabel (Chaguarurco)', true, 1), -- Azuay
                                                             ('Santa Lucía', true, 10), -- Guayas
                                                             ('Santa Rosa', true, 7), -- El Oro
                                                             ('Santiago', true, 15), -- Morona Santiago
                                                             ('Santiago de Méndez', true, 15), -- Morona Santiago
                                                             ('Santo Domingo', true, 21), -- Santo Domingo de los Tsáchilas
                                                             ('Saquisilí', true, 6), -- Cotopaxi
                                                             ('Saraguro', true, 12), -- Loja
                                                             ('Sevilla de Oro', true, 1), -- Azuay
                                                             ('Shushufindi', true, 22), -- Sucumbíos
                                                             ('Sigchos', true, 6), -- Cotopaxi
                                                             ('Sigsig', true, 1), -- Azuay
                                                             ('Simón Bolívar', true, 10), -- Guayas
                                                             ('Sozoranga', true, 12), -- Loja
                                                             ('Sucre', true, 14), -- Manabí
                                                             ('Sucúa', true, 15), -- Morona Santiago
                                                             ('Suscal', true, 3), -- Cañar
                                                             ('Tabacundo', true, 19), -- Pichincha
                                                             ('Taisha', true, 15), -- Morona Santiago
                                                             ('Tarapoa', true, 22), -- Sucumbíos
                                                             ('Tena', true, 16), -- Napo
                                                             ('Tisaleo', true, 23), -- Tungurahua
                                                             ('Tosagua', true, 14), -- Manabí
                                                             ('Tulcán', true, 4), -- Carchi
                                                             ('Urcuquí', true, 11), -- Imbabura
                                                             ('Valdez (Limones)', true, 8), -- Esmeraldas
                                                             ('Valencia', true, 13), -- Los Ríos
                                                             ('Velasco Ibarra (El Empalme)', true, 10), -- Guayas
                                                             ('Ventanas', true, 13), -- Los Ríos
                                                             ('Villa La Unión (Cajabamba)', true, 5), -- Chimborazo
                                                             ('Vinces', true, 13), -- Los Ríos
                                                             ('Yanzatza', true, 24), -- Zamora Chinchipe
                                                             ('Zamora', true, 24), -- Zamora Chinchipe
                                                             ('Zapotillo', true, 12), -- Loja
                                                             ('Zaruma', true, 7), -- El Oro
                                                             ('Zumba', true, 24), -- Zamora Chinchipe
                                                             ('Zumbi', true, 24); -- Zamora Chinchipe


/*********************************TopicsEthnicities*************************************************************************/
-- Insert Ethnicity values
INSERT INTO Ethnicities (Ethnicity_Name, Ethnicity_Status) VALUES
                                                               ('Mestiza/o', true),
                                                               ('Montubia/o', true),
                                                               ('Afroecuatoriano/Afrodescendiente', true),
                                                               ('Indígena', true),
                                                               ('Blanco', true),
                                                               ('Shuar', true),
                                                               ('Cayapas', true),
                                                               ('Achuar', true),
                                                               ('Andoa', true),
                                                               ('Awá', true),
                                                               ('Tsáchilas', true),
                                                               ('Huaoranis', true),
                                                               ('Kitu Kara (Quitus)', true),
                                                               ('Huancavilcas', true),
                                                               ('Cofanes', true),
                                                               ('Pastos', true),
                                                               ('Shiwiar', true),
                                                               ('Secoyas', true),
                                                               ('Siona', true),
                                                               ('Zápara', true),
                                                               ('Épera', true),
                                                               ('Paltas', true),
                                                               ('Mantas', true);
/*********************************TopicsESTADO CIVIL*************************************************************************/
-- Insert Civil Status values
INSERT INTO Civil_Statuses (Civil_Status_Name, Civil_Status_Status) VALUES
                                                                        ('Soltero', true),
                                                                        ('Casado', true),
                                                                        ('Unión de hecho', true),
                                                                        ('Separado', true),
                                                                        ('Viudo', true),
                                                                        ('Divorciado', true);
/*********************************TopicsSEXO*************************************************************************/
-- Insert Sex values
INSERT INTO Sexes (Sex_Name, Sex_Status) VALUES
                                             ('Masculino', true),
                                             ('Femenino', true),
                                             ('LGTBIQ+', true);
/*********************************TopicsDERIVADO POR*************************************************************************/
-- Insert Derived_By values
INSERT INTO Derived_Bies (Derived_By_Name, Derived_By_Status) VALUES
                                                                  ('No', true),
                                                                  ('Defensoría Pública', true),
                                                                  ('Consultorio Jurídico Gratuito', true),
                                                                  ('Juzgado o Unidad Judicial', true),
                                                                  ('Ministerio del Trabajo', true),
                                                                  ('Defensoría del Pueblo', true),
                                                                  ('Junta Cantonal', true),
                                                                  ('ACNUR', true),
                                                                  ('Otros (especificar en observaciones)', true);


INSERT INTO Academic_Instructions (Academic_Instruction_Name, Academic_Instruction_Status) VALUES
                                                                                               ('Analfabeto', true),
                                                                                               ('Prescolar', true),
                                                                                               ('Primaria', true),
                                                                                               ('Secundaria', true),
                                                                                               ('Superior', true),
                                                                                               ('Postgrado', true),
                                                                                               ('Doctorado', true),
                                                                                               ('Sin Instrucción formal', true);



/******************************************AREA*****************************************************************************/
-- Insertar los valores iniciales
INSERT INTO Subjects (Subject_Name, Subject_NRC, Subject_Status) VALUES
                                                                     ('Civil', 'N/A', true),
                                                                     ('Penal','N/A', true),
                                                                     ('Familia', 'N/A', true),
                                                                     ('Movilidad Humana', 'N/A', true),
                                                                     ('Laboral', 'N/A', true),
                                                                     ('Inquilinato','N/A', true),
                                                                     ('Violencia intrafamiliar','N/A', true),
                                                                     ('Tierras','N/A', true),
                                                                     ('Administrativo','N/A', true),
                                                                     ('Constitucional','N/A', true),
                                                                     ('Primeras Consultas', 'N/A', true);

/****************************************TopicsCivil*****************************************************************************/

INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Amparos posesorios', 1, true),
                                                              ('Prescripción adquisitiva de dominio', 1, true),
                                                              ('Posesión efectiva', 1, true),
                                                              ('Procedimiento monitorio', 1, true),
                                                              ('Procedimiento ejecutivo', 1, true),
                                                              ('Desahucio', 1, true),
                                                              ('Incumplimiento de contrato', 1, true),
                                                              ('Privación o suspensión de servicios básicos en el inmueble arrendado', 1, true),
                                                              ('Impedimento o perturbación en el uso y goce de la vivienda arrendada', 1, true),
                                                              ('Terminación de contrato de arrendamiento antes del vencimiento del plazo estipulado en el mismo', 1, true),
                                                              ('Devolución de garantía', 1, true),
                                                              ('Consignación de llaves', 1, true),
                                                              ('Consignación de cánones arrendaticios', 1, true),
                                                              ('Ejecución de actas de mediación', 1, true),
                                                              ('Retención indebida del depósito de garantía', 1, true),
                                                              ('Otro tema (especificar en observaciones)', 1, true);


/*********************************TopicsPenal*********************************************************************************/
-- Insertar los temas relacionados con Subject_ID = 2 (Inquilinato)
INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Contravención de Hurto', 2, true),
                                                              ('Genocidio', 2, true),
                                                              ('Etnocidio', 2, true),
                                                              ('Exterminio', 2, true),
                                                              ('Esclavitud', 2, true),
                                                              ('Deportación o traslado forzoso de población', 2, true),
                                                              ('Desaparición forzada', 2, true),
                                                              ('Ejecución extrajudicial', 2, true),
                                                              ('Persecución', 2, true),
                                                              ('Apartheid', 2, true),
                                                              ('Agresión', 2, true),
                                                              ('Delitos de Lesahumanidad', 2, true),
                                                              ('Trata de personas', 2, true),
                                                              ('Extracción y tratamiento ilegal de órganos y tejidos', 2, true),
                                                              ('Tráfico de organos', 2, true),
                                                              ('Publicidad de tráfico de órganos', 2, true),
                                                              ('Realización de procedimientos de transplante sin autorización', 2, true),
                                                              ('Turismo para la extracción, tratamiento ilegal o comercio de órganos', 2, true),
                                                              ('Explotación sexual de personas', 2, true),
                                                              ('Prostitución forzada', 2, true),
                                                              ('Turismo sexual', 2, true),
                                                              ('Pornografía con utilización de niñas, niños y adolescentes', 2, true),
                                                              ('Trabajos forzados u otras formas de explotación laboral', 2, true),
                                                              ('Promesa de matrimonio o unión de hecho servil', 2, true),
                                                              ('Adopción ilegal', 2, true),
                                                              ('Empleo de personas para mendicidad', 2, true),
                                                              ('Asesinato', 2, true),
                                                              ('Femicidio', 2, true),
                                                              ('Sicariato', 2, true),
                                                              ('Homicidio', 2, true),
                                                              ('Homicidio culposo', 2, true),
                                                              ('Homicidio culposo por mala práctica profesional', 2, true),
                                                              ('Aborto con muerte', 2, true),
                                                              ('Aborto no consentido', 2, true),
                                                              ('Aborto consentido', 2, true),
                                                              ('Aborto no punible', 2, true),
                                                              ('Tortura', 2, true),
                                                              ('Lesiones', 2, true),
                                                              ('Abandono de personas', 2, true),
                                                              ('Intimidación', 2, true),
                                                              ('Instigación al suicidio', 2, true),
                                                              ('Violencia física contra la mujer o miembros del núcleo familiar', 2, true),
                                                              ('Violencia psicológica contra la mujer o miembros del núcleo familiar', 2, true),
                                                              ('Violencia sexual contra la mujer o miembros del núcleo familiar', 2, true),
                                                              ('Privación ilegal de libertad', 2, true),
                                                              ('Secuestro', 2, true),
                                                              ('Secuestro extorsivo', 2, true),
                                                              ('Simulación de secuestro', 2, true),
                                                              ('Desaparición involuntaria', 2, true),
                                                              ('Inseminación no consentida', 2, true),
                                                              ('Privación forzada de capacidad de reproducción', 2, true),
                                                              ('Acoso sexual', 2, true),
                                                              ('Estupro', 2, true),
                                                              ('Distribución de material pornográfico a niñas, niños y adolescentes', 2, true),
                                                              ('Corrupción de niñas, niños y adolescentes', 2, true),
                                                              ('Abuso sexual', 2, true),
                                                              ('Violación', 2, true),
                                                              ('Violación incestuosa', 2, true),
                                                              ('Utilización de personas para exhibición pública con fines de naturaleza sexual', 2, true),
                                                              ('Contacto con finalidad sexual con menores de dieciocho años por medios electrónicos', 2, true),
                                                              ('Oferta de servicios sexuales con menores de dieciocho años por medios electrónicos', 2, true),
                                                              ('Discriminación', 2, true),
                                                              ('Actos de odio', 2, true),
                                                              ('Violación a la intimidad', 2, true),
                                                              ('Violación de propiedad privada', 2, true),
                                                              ('Calumnia', 2, true),
                                                              ('Restricción a la libertad de expresión', 2, true),
                                                              ('Restricción a la libertad de culto', 2, true),
                                                              ('Extorsión', 2, true),
                                                              ('Estafa', 2, true),
                                                              ('Abuso de confianza', 2, true),
                                                              ('Aprovechamiento ilícito de servicios públicos', 2, true),
                                                              ('Robo', 2, true),
                                                              ('Apropiación fraudulenta por medios electrónicos', 2, true),
                                                              ('Hurto', 2, true),
                                                              ('Abigeato', 2, true),
                                                              ('Usurpación', 2, true),
                                                              ('Ocupación, uso ilegal de suelo o tráfico de tierras', 2, true),
                                                              ('Receptación', 2, true),
                                                              ('Daño a bien ajeno', 2, true),
                                                              ('Contravención de hurto', 2, true),
                                                              ('Contravención de abigeato', 2, true),
                                                              ('Supresión, alteración o suposición de la identidad y estado civil', 2, true),
                                                              ('Suplantación de identidad', 2, true),
                                                              ('Tráfico ilícito de migrantes', 2, true),
                                                              ('Producción ilícita de sustancias catalogadas sujetas a fiscalización', 2, true),
                                                              ('Tráfico ilícito de sustancias catalogadas sujetas a fiscalización', 2, true),
                                                              ('Siembra o cultivo', 2, true),
                                                              ('Engaño al comprador respecto a la identidad o calidad de las cosas o servicios vendidos', 2, true),
                                                              ('Retención ilegal de aportación a la seguridad social', 2, true),
                                                              ('Falta de afiliación al Instituto Ecuatoriano de Seguridad Social por parte de una persona jurídica', 2, true),
                                                              ('Falta de afiliación al Instituto Ecuatoriano de Seguridad Social', 2, true),
                                                              ('Lesiones a animales que formen parte del ámbito de la fauna urbana', 2, true),
                                                              ('Abuso sexual a animales que forman parte del ámbito de la fauna urbana', 2, true),
                                                              ('Muerte a animal que forma parte del ámbito de la fauna urbana', 2, true),
                                                              ('Peleas o combates entre perros u otros animales de fauna urbana', 2, true),
                                                              ('Abandono de animales de compañía', 2, true),
                                                              ('Maltrato a animales que forman parte del ámbito de la fauna urbana', 2, true),
                                                              ('Delitos contra el agua', 2, true),
                                                              ('Delitos contra suelo', 2, true),
                                                              ('Contaminación del aire', 2, true),
                                                              ('Perjurio y falso testimonio', 2, true),
                                                              ('Acusación o denuncia maliciosa', 2, true),
                                                              ('Fraude procesal', 2, true),
                                                              ('Ataque o resistencia', 2, true),
                                                              ('Incumplimiento de decisiones legítimas de autoridad competente', 2, true),
                                                              ('Tráfico de moneda', 2, true),
                                                              ('Usura', 2, true),
                                                              ('Tenencia y porte de armas', 2, true),
                                                              ('Armas de fuego, municiones y explosivos no autorizados', 2, true),
                                                              ('Tráfico ilícito de armas de fuego, armas químicas, nucleares o biológicas', 2, true),
                                                              ('Muerte causada por conductor en estado de embriaguez o bajo los efectos de sustancias estupefacientes, psicotrópicas o preparados que las contengan', 2, true),
                                                              ('Muerte culposa', 2, true),
                                                              ('Muerte provocada por negligencia de contratista o ejecutor de obra', 2, true),
                                                              ('Lesiones causadas por accidente de tránsito', 2, true),
                                                              ('Daños materiales', 2, true),
                                                              ('Contravenciones de tránsito (especificar en observaciones)', 2, true),
                                                              ('Contravenciones penales (especificar en observaciones)', 2, true),
                                                              ('Otro tema (especificar en observaciones)', 2, true);


/*********************************TopicsFamily*****************************************************************************/

INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Alimentos', 3, true),
                                                              ('Alimentos congruos', 3, true),
                                                              ('Alimentos internacionales', 3, true),
                                                              ('Alimentos para mujer embarazada', 3, true),
                                                              ('Incidente de aumento de pensiones alimenticias', 3, true),
                                                              ('Incidente de rebaja de pensiones alimenticias', 3, true),
                                                              ('Autorización de salida del país.', 3, true),
                                                              ('Declaración de adoptabilidad', 3, true),
                                                              ('Divorcio por mutuo consentimiento', 3, true),
                                                              ('Medidas de Protección', 3, true),
                                                              ('Medidas de Protección (medidas administrativas en sede judicial', 3, true),
                                                              ('Paternidad y alimentos', 3, true),
                                                              ('Paternidad y alimentos internacionales.', 3, true),
                                                              ('Recuperación Internacional de niños, niñas y adolescentes', 3, true),
                                                              ('Régimen de visitas', 3, true),
                                                              ('Régimen de visitas internacional', 3, true),
                                                              ('Custodias Familiares', 3, true),
                                                              ('Acogimiento Institucional', 3, true),
                                                              ('Restitución de niños, niñas y adolescentes', 3, true),
                                                              ('Detenido por boleta de apremio', 3, true),
                                                              ('Curadurías especiales', 3, true),
                                                              ('Divorcio por causal', 3, true),
                                                              ('Disolución de unión de hecho', 3, true),
                                                              ('Patria potestad (limitación, suspensión y privación)', 3, true),
                                                              ('Declaratoria judicial de unión de hecho post mortem', 3, true),
                                                              ('Liquidación de alimentos', 3, true),
                                                              ('Inscripciones tardías de nacimiento', 3, true),
                                                              ('Investigación de paternidad', 3, true),
                                                              ('Recuperación inmediata de menores', 3, true),
                                                              ('Privación de patria potestad con declaración de adoptabilidad', 3, true),
                                                              ('Impugnación de paternidad y maternidad', 3, true),
                                                              ('Tenencia', 3, true),
                                                              ('Alimentos para adulto mayor', 3, true),
                                                              ('Otro tema (especificar en observaciones)', 3, true);




/*********************************TopicsMovilidad Humana************************************************************************/

INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Refugio', 4, true),
                                                              ('Regularización del extranjero', 4, true),
                                                              ('Prevención de casos de apátridia', 4, true),
                                                              ('Deportación', 4, true),
                                                              ('Regularización migratoria', 4, true),
                                                              ('Proceso de refugio', 4, true),
                                                              ('Proceso de Deportación', 4, true),
                                                              ('Proceso de apatridia', 4, true),
                                                              ('Régimen sancionatorio', 4, true),
                                                              ('Inadmisión', 4, true),
                                                              ('Naturalización', 4, true),
                                                              ('Repatriación', 4, true),
                                                              ('Otro tema (especificar en observaciones)', 4, true);




/*********************************TopicsLaboral*****************************************************************************/
INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Reclamación e impugnación por visto bueno', 5, true),
                                                              ('Conciliación', 5, true),
                                                              ('Reclamación e impugnación por desahucio', 5, true),
                                                              ('Denuncias', 5, true),
                                                              ('Denuncias MT', 5, true),
                                                              ('Desahucio', 5, true),
                                                              ('Audiencia de boleta única', 5, true),
                                                              ('Solicitud de constatación de despido intempestivo, cambio de ocupación del trabajador, investigación integral de las empresas, etc.', 5, true),
                                                              ('Incumplimiento de contrato', 5, true),
                                                              ('Investigación integral de las empresas', 5, true),
                                                              ('Accidentes laborales', 5, true),
                                                              ('Reclamación de derechos sociales adquiridos', 5, true),
                                                              ('Despidos intempestivos', 5, true),
                                                              ('Jubilación patronal', 5, true),
                                                              ('Impugnación de actas de finiquito', 5, true),
                                                              ('Cambio de ocupación del trabajo', 5, true),
                                                              ('Incumplimiento de contratos', 5, true),
                                                              ('Solicitud de boleta única', 5, true),
                                                              ('Impugnación  por desahucios', 5, true),
                                                              ('Reclamación e impugnación por visto bueno', 5, true),
                                                              ('Reclamo de remuneraciones mensuales o adicionales en procedimiento monitorio', 5, true),
                                                              ('Solicitud de constatación de despido intempestivo', 5, true),
                                                              ('Solicitud de constatación de investigación integral de las empresas', 5, true),
                                                              ('Accidentes laborales', 5, true),
                                                              ('Reclamación de derechos sociales adquiridos', 5, true),
                                                              ('Despido intempestivo', 5, true),
                                                              ('Despido por discriminación', 5, true),
                                                              ('Despido injustificado de personas con discapacidad o de quien tuviere a su cargo la manutención de la persona con discapacidad', 5, true),
                                                              ('Despido ineficaz', 5, true),
                                                              ('Jubilación patronal', 5, true),
                                                              ('Impugnación de actas de finiquito', 5, true),
                                                              ('Impugnación de actos administrativos (LOSEP)', 5, true),
                                                              ('Recurso de revisión y apelación (Código Orgánico Administrativo', 5, true),
                                                              ('Acción de plena jurisdicción o subjetivo del accionante (Código Orgánico General de Procesos)', 5, true),
                                                              ('Solicitud de constatación de cambio de ocupación del trabajador', 5, true),
                                                              ('Ejecución de acta de mediación', 5, true),
                                                              ('Ejecución de sentencia', 5, true),
                                                              ('Incumplimiento de contratos', 5, true),
                                                              ('Solicitud de boleta única', 5, true),
                                                              ('Audiencia de boleta única', 5, true),
                                                              ('Reclamación e Impugnación  por desahucios', 5, true),
                                                              ('Otro tema (especificar en observaciones)', 5, true);








/*********************************TopicsInquilinato*****************************************************************************/
INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Desahucios inquilinato', 6, true),
                                                              ('Incumplimiento de contratos inquilinato', 6, true),
                                                              ('Desahucio', 6, true),
                                                              ('Incumplimiento de contrato', 6, true),
                                                              ('Privación o suspensión de servicios básicos en el inmueble arrendado', 6, true),
                                                              ('Impedimento o perturbación en el uso y goce de la vivienda arrendada', 6, true),
                                                              ('Terminación de contrato de arrendamiento antes del vencimiento del plazo estipulado en el mismo', 6, true),
                                                              ('Devolución de garantía', 6, true),
                                                              ('Consignación de llaves', 6, true),
                                                              ('Consignación de cánones arrendaticios', 6, true),
                                                              ('Ejecución de actas de mediación', 6, true),
                                                              ('Otro tema (especificar en observaciones)', 6, true),
                                                              ('Retención indebida del depósito de garantía', 6, true),
                                                              ('Otro tema (especificar en observaciones)', 6, true);



/*********************************TopicsViolenciaFamiliar************************************************************************/
INSERT INTO Topics  ( Topic_Name , Subject_FK, Topic_Status) VALUES
                                                                 ('Violencia intrafamiliar', 7, true),
                                                                 ('Denuncias de VIF', 7, true),
                                                                 ('Patrocinio de causas de VIF', 7, true),
                                                                 ('Contravención de Violencia contra la mujer o miembros del núcleo familiar', 7, true),
                                                                 ('Delito de Violencia contra la mujer o miembros del núcleo familiar', 7, true),
                                                                 ('Otro tema (especificar en observaciones)', 7, true);

/*********************************TopicsTierras*********************************************************************************/
INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Legalización de tierras', 8, true),
                                                              ('Oposición de tierras', 8, true),
                                                              ('Servidumbre', 8, true),
                                                              ('Linderos', 8, true),
                                                              ('Reversión de tierras', 8, true),
                                                              ('Adjudicación de tierras', 8, true),
                                                              ('Otro tema (especificar en observaciones)', 8, true);



/*********************************TopicsAdministrativo*************************************************************************/

INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Trámite administrativo', 9, true),
                                                              ('Proceso Sancionatorio', 9, true),
                                                              ('Peticiones al Ministerio Coordinador de Desarrollo Social', 9, true),
                                                              ('Peticiones a la Defensoría del Pueblo', 9, true),
                                                              ('Peticiones al Instituto Ecuatoriano de Seguridad Social', 9, true),
                                                              ('Petición a GAD''s', 9, true),
                                                              ('Sanciones Disciplinarias', 9, true),
                                                              ('Peticiones a EP', 9, true),
                                                              ('Acceso y manejo de aguas', 9, true),
                                                              ('Peticiones', 9, true),
                                                              ('Trámites registral', 9, true),
                                                              ('Trámites notariales', 9, true),
                                                              ('Derecho Administrativo', 9, true),
                                                              ('Procesos institucionales internos en etapa administrativa', 9, true),
                                                              ('Contencioso Administrativo', 9, true),
                                                              ('Trámites notariales o registrales', 9, true),
                                                              ('Trámites administrativos en instituciones públicas', 9, true),
                                                              ('Procesos institucionales internos en etapa administrativa', 9, true),
                                                              ('Proceso sancionatorio', 9, true),
                                                              ('Procesos disciplinarios', 9, true),
                                                              ('Reclamos al Gad Municipal', 9, true),
                                                              ('Acción de daños y perjuicios', 9, true),
                                                              ('Peticiones a Institución Pública', 9, true),
                                                              ('Reclamos', 9, true),
                                                              ('Otro tema (especificar en observaciones)', 9, true);


/*********************************TopicsConstitucional*************************************************************************/
INSERT INTO Topics (Topic_Name, Subject_FK, Topic_Status) VALUES
                                                              ('Habeas Corpus', 10, true),
                                                              ('Habeas Data', 10, true),
                                                              ('Acción de protección', 10, true),
                                                              ('Acción extraordinaria de protección', 10, true),
                                                              ('Medidas cautelares', 10, true),
                                                              ('Acción por incumplimiento', 10, true),
                                                              ('Acceso a la Información', 10, true),
                                                              ('Acciones de control constitucional', 10, true),
                                                              ('Amicus Curiae', 10, true),
                                                              ('Acción de incumplimiento', 10, true),
                                                              ('Acción pública de inconstitucionalidad', 10, true),
                                                              ('Otro tema (especificar en observaciones)', 10, true);

/*********************************TopicsOcupación*************************************************************************/
-- Insert Occupation values
INSERT INTO Occupations (Occupation_Name, Occupation_Status) VALUES
                                                                 ('Actividad económica', true),
                                                                 ('Empleado Privado', true),
                                                                 ('Cuenta propia', true),
                                                                 ('Jornalero o peón', true),
                                                                 ('Empleado u obrero del Estado, Municipio o Consejo Provincial', true),
                                                                 ('No declarado', true),
                                                                 ('Empleado doméstico', true),
                                                                 ('Patrono', true),
                                                                 ('Trabajador no remunerado', true),
                                                                 ('Socio', true);



/*************************TopicsNiveldeingresospersonales*************************************************************************/
-- Insert Income Level values
INSERT INTO Income_Levels (Income_Level_Name, Income_Level_Status) VALUES
                                                                       ('0', true),
                                                                       ('< 1 SBU', true),
                                                                       ('1 SBU', true),
                                                                       ('2 SBU', true),
                                                                       ('3 SBU', true),
                                                                       ('4 SBU', true),
                                                                       ('5 SBU', true),
                                                                       ('> 5 SBU', true);


/*************************TopicsGrupo Familiar*************************************************************************/
-- Insert Family Group values
INSERT INTO Family_Groups (Family_Group_Name, Family_Group_Status) VALUES
                                                                       ('Hijos/as', true),
                                                                       ('Esposo/a', true),
                                                                       ('Papá', true),
                                                                       ('Mamá', true),
                                                                       ('Hermanos/as', true),
                                                                       ('Abuelo', true),
                                                                       ('Abuela', true),
                                                                       ('Tíos/as', true),
                                                                       ('Sobrinos/as', true);

/*************************TopicsIngresos familiares*************************************************************************/
-- Insert Family Income Level values
INSERT INTO Family_Incomes (Family_Income_Name, Family_Income_Status) VALUES
                                                                          ('0', true),
                                                                          ('< 1 SBU', true),
                                                                          ('1 SBU', true),
                                                                          ('2 SBU', true),
                                                                          ('3 SBU', true),
                                                                          ('4 SBU', true),
                                                                          ('5 SBU', true),
                                                                          ('> 5 SBU', true);
/*************************TopicsTipo de Vivienda*************************************************************************/
-- Insert Type of Housing values
INSERT INTO Type_Of_Housings (Type_Of_Housing_Name, Type_Of_Housing_Status) VALUES
                                                                                ('Propia', true),
                                                                                ('Arrendada', true),
                                                                                ('Familiar (comparte pero no paga)', true);
/*************************TopicsPatrimonio propio*************************************************************************/
-- Insert Own Assets values
INSERT INTO Own_Assets (Own_Assets_Name, Own_Assets_Status) VALUES
                                                                ('Vehículo propio', true),
                                                                ('Casa propia', true),
                                                                ('Propiedad en litigio', true),
                                                                ('Terreno en proceso de regularización', true),
                                                                ('Otro', true),
                                                                ('No posee ninguno', true);
/*************************TopicsPensioners***************************************************************/
-- Insert Pensioner values
INSERT INTO Pensioners (Pensioner_Name, Pensioner_Status) VALUES
                                                              ('No', true),
                                                              ('IESS', true),
                                                              ('ISSPOL', true),
                                                              ('ISSFA', true),
                                                              ('Jubilación en el extranjero', true),
                                                              ('Otro', true);
/*************************TopicsSeguroi de salud***********************************************/
-- Insert Pensioner values
INSERT INTO Health_Insurances (Health_Insurance_Name, Health_Insurance_Status) VALUES
                                                                                   ('No', true),
                                                                                   ('IESS', true),
                                                                                   ('Privado Particular', true),
                                                                                   ('Privado Empresa', true),
                                                                                   ('Otro', true);

/*************************TopicsEnfermedad Catastrófica*******************************************/
-- Insert Catastrophic Illness values
INSERT INTO Catastrophic_Illnesses (Catastrophic_Illness_Name, Catastrophic_Illness_Status) VALUES
                                                                                                ('Todo tipo de malformaciones congénitas de corazón y todo tipo de valvulopatías cardiacas', true),
                                                                                                ('Todo tipo de cáncer', true),
                                                                                                ('Tumor cerebral en cualquier estadio y de cualquier tipo', true),
                                                                                                ('Insuficiencia renal crónica', true),
                                                                                                ('Trasplante de órganos: riñón, hígado, médula ósea', true),
                                                                                                ('Secuelas de quemaduras graves', true),
                                                                                                ('Malformaciones arterio venosas cerebrales', true),
                                                                                                ('Síndrome de klippel trenaunay', true),
                                                                                                ('Aneurisma tóraco-abdominal', true),
                                                                                                ('Otro', true);

/*************************TopicsSituaciónVulnerabilidad*******************************************/
-- Insert Vulnerable Situation values
INSERT INTO Vulnerable_Situations (Vulnerable_Situation_Name, Vulnerable_Situation_Status) VALUES
                                                                                               ('No', true),
                                                                                               ('Persona en movilidad Humana', true),
                                                                                               ('Persona o familiar de un PPL', true);

/*************************TopicsProtocolos*******************************************/
-- Insert Protocol values
INSERT INTO Protocols (Protocol_Name, Protocol_Status) VALUES
                                                           ('Código Azul', true),
                                                           ('Código Rojo', true),
                                                           ('Trabajo Social', true),
                                                           ('Psicología', true),
                                                           ('Comunidad PUCE', true);

/*************************TopicsEstado del Caso*******************************************/
-- Insert Case Status values
INSERT INTO Case_Statuses (Case_Status_Name, Case_Status_Status) VALUES
                                                                     ('Sin iniciar', true),
                                                                     ('Iniciado con otro abogado', true),
                                                                     ('Con sentencia', true),
                                                                     ('Archivado', true);


INSERT INTO Disabilities (Disability_Name, Disability_Status) VALUES
                                                                  ('Física', true),
                                                                  ('Auditiva', true),
                                                                  ('Visual', true),
                                                                  ('Intelectual', true),
                                                                  ('Psicosocial', true),
                                                                  ('Múltiple', true),
                                                                  ('Otro', true);


INSERT INTO Type_Of_Attentions (Type_Of_Attention_Name, Type_Of_Attention_Status) VALUES
                                                                                      ('Asesoría', true),
                                                                                      ('Solicitud de patrocinio', true),
                                                                                      ('Patrocinio', true);

INSERT INTO Complexities (Complexity_Name, Complexity_Status) VALUES
                                                                  ('Bajo', true),
                                                                  ('Medio', true),
                                                                  ('Alto', true);


INSERT INTO Client_Types (Client_Type_Name, Client_Type_Status) VALUES
                                                                    ('Actor/Denunciante', true),
                                                                    ('Demandado/Denunciado', true);

INSERT INTO Profiles (Profile_Name, Profile_Status) VALUES
                                                        ('Coordinador', true),
                                                        ('Abogado', true),
                                                        ('Secretaria', true),
                                                        ('Estudiante', true),
                                                        ('Trabajo Social', true);

/*********************************TopicsTiposdeActividad*********************************************************************************/

INSERT INTO Type_Of_Activities (Type_Of_Activity_Name, Type_Of_Activity_Status)
VALUES ('Informe de Viabilidad', TRUE);

INSERT INTO Type_Of_Activities (Type_Of_Activity_Name, Type_Of_Activity_Status)
VALUES ('Presentación de Demanda', TRUE);

INSERT INTO Type_Of_Activities (Type_Of_Activity_Name, Type_Of_Activity_Status)
VALUES ('Contestación de demanda', TRUE);

INSERT INTO Type_Of_Activities (Type_Of_Activity_Name, Type_Of_Activity_Status)
VALUES ('Escrito de acreditación', TRUE);

INSERT INTO Type_Of_Activities (Type_Of_Activity_Name, Type_Of_Activity_Status)
VALUES ('Impulso', TRUE);

INSERT INTO Type_Of_Activities (Type_Of_Activity_Name, Type_Of_Activity_Status)
VALUES ('Solicitud de audiencia', TRUE);

/*********************************TopicsCamposdeActividad*********************************************************************************/

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Descripción de Actividad',
           'Texto',
           1,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Descripción de Actividad',
           'Texto',
           2,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Fecha de Actividad',
           'Fecha',
           2,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Lugar',
           'Lugar',
           2,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Tiempo de Ejecución',
           'Tiempo',
           2,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Descripción de Actividad',
           'Texto',
           3,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Fecha de Actividad',
           'Fecha',
           3,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Lugar',
           'Lugar',
           3,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Tiempo de Ejecución',
           'Tiempo',
           3,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Descripción de Actividad',
           'Texto',
           4,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Fecha de Actividad',
           'Fecha',
           4,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Lugar',
           'Lugar',
           4,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Tiempo de Ejecución',
           'Tiempo',
           4,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Descripción de Actividad',
           'Texto',
           5,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Fecha de Actividad',
           'Fecha',
           5,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Lugar',
           'Lugar',
           5,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Tiempo de Ejecución',
           'Tiempo',
           5,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Descripción de Actividad',
           'Texto',
           6,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Fecha de Actividad',
           'Fecha',
           6,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Lugar',
           'Lugar',
           6,
           TRUE
       );

INSERT INTO Field_Of_Activities (
    Field_Of_Activity_Name,
    Field_Of_Activity_Type,
    Type_Of_Activity_FK,
    Field_Of_Activity_Status
)
VALUES (
           'Tiempo de Ejecución',
           'Tiempo',
           6,
           TRUE
       );

INSERT INTO Number_Of_Attempts(Number_Of_Attempts, Number_Of_Attempts_Status) VALUES (
                                                                                         3,
                                                                                         TRUE
                                                                                     );

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
