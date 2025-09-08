
DROP TABLE IF EXISTS `vaccines`;
DROP TABLE IF EXISTS `diseases`;
DROP TABLE IF EXISTS `disease_types`;


CREATE TABLE `disease_types` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `type_name` VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `diseases` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `disease_name` VARCHAR(100) NOT NULL UNIQUE,
  `description` TEXT,
  `disease_type_id` INT,
  FOREIGN KEY (`disease_type_id`) REFERENCES `disease_types`(`id`)
);

CREATE TABLE `vaccines` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `vaccine_name` VARCHAR(100) NOT NULL,
  `protects_against_id` INT,
  `status` ENUM('Available in UIP', 'Available Privately', 'In Development', 'Widely Administered', 'No Vaccine') NOT NULL,
  `schedule_details` TEXT,
  `notes` TEXT,
  FOREIGN KEY (`protects_against_id`) REFERENCES `diseases`(`id`)
);
INSERT INTO `disease_types` (`id`, `type_name`) VALUES
(1, 'Communicable'),
(2, 'Non-Communicable'),
(3, 'Other Health Issues');

INSERT INTO `diseases` (`disease_name`, `description`, `disease_type_id`) VALUES
('Tuberculosis', 'A common and significant bacterial infection that can affect various organs.', 1),
('Malaria', 'A widespread mosquito-borne disease.', 1),
('Dengue', 'A common mosquito-borne viral infection.', 1),
('Chikungunya', 'Another common mosquito-borne viral infection.', 1),
('COVID-19', 'A global pandemic that remains a significant health challenge.', 1),
('Hepatitis B', 'A viral infection that spreads in various ways and affects the liver.', 1),
('Typhoid', 'An infectious disease that often stems from contaminated water or food.', 1),
('Cholera', 'An intestinal infection caused by bacteria in contaminated water or food.', 1),
('Influenza', 'A contagious respiratory illness that spreads through droplets.', 1),
('Japanese Encephalitis', 'A vector-borne viral disease that causes brain inflammation.', 1),
('Cervical Cancer', 'A type of cancer that occurs in the cells of the cervix, preventable by HPV vaccine.', 2),
('HIV/AIDS', 'A prevalent communicable disease that continues to be a challenge.', 1);

INSERT INTO `diseases` (`disease_name`, `description`, `disease_type_id`) VALUES
('Heart Disease', 'A leading cause of death and disability in India.', 2),
('Stroke', 'A major cause of death and disability.', 2),
('Cancer (General)', 'A significant health concern with a substantial number of new cases reported annually.', 2),
('Diabetes', 'A chronic condition that affects a large part of the population.', 2),
('Chronic Respiratory Diseases (COPD)', 'Lung diseases that are common and can lead to difficulty breathing.', 2),
('Malnutrition', 'A critical issue, especially among children, impacting overall health and development.', 3);

INSERT INTO `vaccines` (`vaccine_name`, `protects_against_id`, `status`, `schedule_details`, `notes`) VALUES

('BCG Vaccine', (SELECT id FROM diseases WHERE disease_name = 'Tuberculosis'), 'Available in UIP', 'Single intradermal dose given to infants at birth or up to one year of age.', NULL),
('AdFalciVax', (SELECT id FROM diseases WHERE disease_name = 'Malaria'), 'In Development', 'Indigenous multi-stage malaria vaccine candidate.', NULL),
('TAK-003 (Malaria)', (SELECT id FROM diseases WHERE disease_name = 'Malaria'), 'In Development', 'Anticipated to launch in India by 2026.', NULL),
('DengiAll', (SELECT id FROM diseases WHERE disease_name = 'Dengue'), 'In Development', 'Single-dose vaccine in Phase III trials. Results expected in 2026.', NULL),
('TAK-003 (Dengue)', (SELECT id FROM diseases WHERE disease_name = 'Dengue'), 'In Development', 'Undergoing trials in India with a potential launch in 2026.', NULL),
('Hepatitis B Vaccine', (SELECT id FROM diseases WHERE disease_name = 'Hepatitis B'), 'Available in UIP', 'First dose at birth, followed by doses at 6, 10, and 14 weeks, often in a pentavalent combination.', NULL),
('Typhoid Conjugate Vaccine (TCV)', (SELECT id FROM diseases WHERE disease_name = 'Typhoid'), 'Available Privately', 'Single dose for children from 6 months onwards and adults. Booster recommended every 3 years.', 'Also available in some public health programs.'),
('Oral Cholera Vaccines (OCV)', (SELECT id FROM diseases WHERE disease_name = 'Cholera'), 'Available Privately', 'Two-dose schedule. Recommended in outbreak-prone areas.', 'Examples: Shanchol, Euvichol.'),
('Seasonal Flu Shot (e.g., Influvac Tetra)', (SELECT id FROM diseases WHERE disease_name = 'Influenza'), 'Available Privately', 'Annual shot recommended for all individuals aged 6 months and older.', 'Vaccine composition is updated annually.'),
('Japanese Encephalitis Vaccine', (SELECT id FROM diseases WHERE disease_name = 'Japanese Encephalitis'), 'Available in UIP', 'Administered in endemic districts. First dose at 9 months, second dose at 16-24 months.', NULL),
('COVID-19 Vaccines (Covishield, Covaxin, etc.)', (SELECT id FROM diseases WHERE disease_name = 'COVID-19'), 'Widely Administered', 'Primary and booster doses have been administered. Now being integrated into routine immunization frameworks.', NULL),
('Human Papillomavirus (HPV) Vaccine', (SELECT id FROM diseases WHERE disease_name = 'Cervical Cancer'), 'Available Privately', 'Recommended for girls aged 9-14 years in a two or three-dose schedule to prevent cervical cancer.', 'Efforts are underway to include it in the UIP.'),


('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Chikungunya'), 'No Vaccine', NULL, NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'HIV/AIDS'), 'No Vaccine', 'Prevention is through other means; research on therapeutic and preventive vaccines is ongoing.', NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Heart Disease'), 'No Vaccine', NULL, NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Stroke'), 'No Vaccine', NULL, NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Cancer (General)'), 'No Vaccine', 'Exception is vaccine-preventable cancers like Cervical Cancer (HPV) and Liver Cancer (Hepatitis B).', NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Diabetes'), 'No Vaccine', NULL, NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Chronic Respiratory Diseases (COPD)'), 'No Vaccine', NULL, NULL),
('No Vaccine Available', (SELECT id FROM diseases WHERE disease_name = 'Malnutrition'), 'No Vaccine', 'Addressed through nutrition and public health interventions.', NULL);

