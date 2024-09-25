SELECT * FROM psyliq.diabetes_prediction;

SELECT 
    Patient_id, age
FROM
    psyliq.diabetes_prediction;

SELECT 
    *
FROM
    psyliq.diabetes_prediction
WHERE
    gender = 'Female' AND age > 40;

SELECT avg(bmi) as avg_bmi
FROM psyliq.diabetes_prediction;


SELECT *
FROM psyliq.diabetes_prediction
ORDER BY blood_glucose_level DESC;

SELECT *
FROM psyliq.diabetes_prediction
WHERE hypertension = 1 and diabetes = 1;

SELECT distinct(count(patient_id)) as numof_patient_heartdisease
FROM psyliq.diabetes_prediction
WHERE heart_disease = 1;

SELECT count(patient_id) as patients_count, smoking_history,
CASE 
     WHEN smoking_history = 'current' THEN 'Smokers'
	WHEN smoking_history = 'ever' THEN 'Smokers'
    WHEN smoking_history = 'No Info' THEN 'Unkown'
	 ELSE 'Non smokers'
     END AS Smoking_history
FROM psyliq.diabetes_prediction
GROUP BY Smoking_history
ORDER BY patient_id DESC;

SELECT patient_id, bmi
FROM psyliq.diabetes_prediction
WHERE bmi > (SELECT AVG(bmi) FROM psyliq.diabetes_prediction);

SELECT *
FROM psyliq.diabetes_prediction
ORDER BY HbA1c_level DESC
LIMIT 1;

SELECT *
FROM psyliq.diabetes_prediction
ORDER BY HbA1c_level ASC
LIMIT 1;

SELECT EmployeeName, patient_id,
       YEAR(now()) - age AS birth_years,
       YEAR(now()) - YEAR(now()) + age AS current_age
FROM psyliq.diabetes_prediction;

select patient_id, gender, blood_glucose_level,
rank() over(partition by gender order by blood_glucose_level) as max_rank
from psyliq.diabetes_prediction; 

UPDATE psyliq.diabetes_prediction
SET smoking_history = 'Ex-smoker'
WHERE age > 50;

INSERT INTO psyliq.diabetes_prediction (EmployeeName, Patient_id, gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)
VALUES
('Joe King', 'PT100101', 'Male', 36, 0, 0, 'current', 25.5, 5.0, 120, 0);

DELETE FROM psyliq.diabetes_prediction
WHERE heart_disease = 1;

SELECT * 
FROM psyliq.diabetes_prediction AS p1
WHERE hypertension = 1 AND NOT EXISTS (
SELECT 1
FROM psyliq.diabetes_prediction AS p2
WHERE p1.patient_id = p2.patient_id AND p2.diabetes = 1);

ALTER TABLE psyliq.diabetes_prediction
ADD CONSTRAINT unique_patient_id UNIQUE (Patient_id);

CREATE VIEW patient_view AS 
SELECT Patient_id, age, bmi
FROM psyliq.diabetes_prediction;

SELECT * FROM patient_view;