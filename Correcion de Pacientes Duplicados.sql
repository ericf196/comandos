'averiguar los pctes repetido Y extraer los id'
SELECT * FROM pacientes WHERE nombre LIKE 'genove%'
7285, 7397
Correcto: 7285
Incorrecto: 7397

SELECT * FROM `pacienteseguros`
WHERE idpacientes IN (7285, 7397)
AND fecha_eliminacion IS NULL AND eliminado=0

'Si Ambos pctes tiene hospitalizacion ACTIVA, Cambiar la hospitalizacion, 
cual se queda activo Y el resto finalizado (toca cambiar la hospitalizacion de los pics)
Recuerda mantener uno solo activo en los perfiles tambien
Si tiene varias hospitalizacion pero solo una activa, solo hacer el cambio de idpaciente y ya'

SELECT * FROM hospitalizacion WHERE paciente IN (7285, 7397);
UPDATE hospitalizacion SET paciente = 7285 WHERE paciente = 7397;
8140, 8174
Correctas: 8140
Incorrecta: 8174

OZ438582, QC819247
Correctas: OZ438582
Incorrecta: QC819247


SELECT * FROM hospitalizacion_perfil_clinico WHERE id_hospitalizacion IN (8140, 8174)
UPDATE hospitalizacion_perfil_clinico SET id_hospitalizacion = 8140 WHERE id_hospitalizacion = 8174;

SELECT * FROM `hospitalizacion_historico` WHERE id_hospitalizacion IN (8140, 8174)
UPDATE hospitalizacion_historico SET id_hospitalizacion = 8140 WHERE id_hospitalizacion = 8174;

SELECT * FROM `hospitalizacion_perfil_administrativo` WHERE id_hospitalizacion IN (8140, 8174)
UPDATE `hospitalizacion_perfil_administrativo` SET id_hospitalizacion = 8140 WHERE id_hospitalizacion = 8174;


'Cambiar los pic al id de pcte que se decidio dejar, usualmente el que carga mas info'
SELECT * FROM prepic WHERE idpacientes IN (7285, 7397);
UPDATE prepic SET idpacientes = 7285 WHERE idpacientes = 7397;
UPDATE prepic SET cod_hospitalizacion ='OZ438582' WHERE cod_hospitalizacion='QC819247';

'Cambiar los pic en ejecucion (perfil ADMIN) al id de pcte que se decidio dejar'
SELECT * FROM picejecucion WHERE idpaciente IN (7397, 7285);
UPDATE picejecucion SET idpaciente = 7285 WHERE idpaciente = 7397;
UPDATE picejecucion SET cod_hospitalizacion ='OZ438582' WHERE cod_hospitalizacion='QC819247';


'Revisar Y cambiar las visitas'
SELECT * FROM `asignacion_turnos` WHERE id_paciente IN (7397, 7285);
UPDATE asignacion_turnos SET id_paciente=7285 WHERE id_paciente = 7397;

SELECT * FROM eventoscalendario WHERE idpaciente IN (7397, 7285);
UPDATE eventoscalendario SET idpaciente = 7285 WHERE idpaciente = 7397;
UPDATE eventoscalendario SET idpic = 8140 WHERE idpic = 8174;

SELECT * FROM `visitas` WHERE idpaciente IN (7397, 7285);
UPDATE visitas SET idpaciente = 7285 WHERE idpaciente = 7397;
UPDATE visitas SET idpic = 8140 WHERE idpic = 8174;

SELECT * FROM `medication_log` WHERE patient_id IN (7397, 7285);
UPDATE medication_log SET patient_id=7285 WHERE patient_id=7397;

SELECT * FROM `healing_logs` WHERE patient_id IN (7397, 7285);

'Cambiar info de visita medicas'
SELECT * FROM `pacientesvisitas` WHERE idpacientes IN (7397, 7285);
UPDATE pacientesvisitas SET idpacientes = 7285 WHERE idpacientes = 7397;
UPDATE pacientesvisitas SET idprepic = 8140 WHERE idprepic = 8174;

SELECT * FROM `pacientesexamenesf` WHERE idpaciente IN (7397, 7285);
UPDATE `pacientesexamenesf` SET idpaciente = 7285 WHERE idpaciente = 7397;

SELECT * FROM `pacientesexamenesg` WHERE idpaciente IN (7397, 7285);
UPDATE `pacientesexamenesg` SET idpaciente = 7285 WHERE idpaciente = 7397;

SELECT * FROM `pac_evaluaciones` WHERE idpaciente IN (7397, 7285);
UPDATE `pac_evaluaciones` SET idpaciente = 7285 WHERE idpaciente = 7397;

'Cambiar Acuses, cierres Y transacciones'
SELECT * FROM acuses WHERE idpaciente IN (7397, 7285);
UPDATE acuses SET idpaciente = 7285 WHERE idpaciente = 7397;
UPDATE acuses SET idhospitalizacion = 8140 WHERE idhospitalizacion = 8174;

SELECT * FROM cierres WHERE idpaciente IN (7397, 7285);
UPDATE cierres SET idpaciente = 7285 WHERE idpaciente = 7397;
UPDATE cierres SET id_hospitalizacion = 8140 WHERE id_hospitalizacion = 8174;

SELECT * FROM transacciones WHERE remitente IN (7397, 7285);
UPDATE transacciones SET remitente = 7285 WHERE remitente = 7397;

SELECT * FROM transacciondetalle WHERE destinatario IN (7397, 7285);
UPDATE transacciondetalle SET destinatario = 7285 WHERE destinatario = 7397;

'Cambiar ordenes de labs'
SELECT * FROM `orden_laboratorio` WHERE idpaciente IN (7397, 7285);
UPDATE orden_laboratorio SET idpaciente = 7285 WHERE idpaciente = 7397;
UPDATE orden_laboratorio SET idhospitalizacion = 8140 WHERE idhospitalizacion = 8174;

'Cambiar OM Y TM Recordar dejar uno solo activo'
SELECT * FROM `ordenmedicav1` WHERE paciente_id IN (7397, 7285);
UPDATE ordenmedicav1 SET paciente_id= 7285 WHERE paciente_id=7397;
UPDATE ordenmedicav1 SET hospitalizacion_id=8140 WHERE hospitalizacion_id=8174;

SELECT * FROM `tarjeta_medicamentos` WHERE id_paciente IN (7397, 7285);
UPDATE tarjeta_medicamentos SET id_paciente= 7285 WHERE id_paciente=7397;
UPDATE tarjeta_medicamentos SET id_hospitalizacion=8140 WHERE id_hospitalizacion=8174;

SELECT * FROM `pac_tratamientos` WHERE idpaciente IN (7397, 7285);
UPDATE pac_tratamientos SET idpaciente=7285 WHERE idpaciente = 7397;

'Cambiar recetas y notas de evolucion'
SELECT * FROM `prescriptions` WHERE patient_id IN (7397, 7285);
UPDATE prescriptions SET patient_id= 7285 WHERE patient_id = 7397;

SELECT * FROM `notas_evaluacion` WHERE idpaciente IN (7397, 7285);
UPDATE notas_evaluacion SET idpaciente = 7285 WHERE idpaciente = 7397;

'Actualizar info del historial clinico del pcte'
SELECT * FROM `pac_alergias`WHERE idpaciente IN (7397, 7285);
UPDATE pac_alergias SET idpaciente = 7285 WHERE idpaciente = 7397;

SELECT * FROM `pac_antecedentesali` WHERE idpaciente IN (7397, 7285);

SELECT * FROM `pac_antecedentesfam`  WHERE idpaciente IN (7397, 7285);
UPDATE pac_antecedentesfam SET idpaciente = 7285 WHERE idpaciente = 7397;

SELECT * FROM `pac_antecedentesper`  WHERE idpaciente IN (7397, 7285);
UPDATE `pac_antecedentesper` SET idpaciente = 7285 WHERE idpaciente = 7397;

SELECT * FROM `pac_antecedentespsi`  WHERE id_paciente IN (7397, 7285);

SELECT * FROM `pac_antecedentespsifam` WHERE id_paciente IN (7397, 7285);

SELECT * FROM `pac_antecedentesqui`  WHERE idpaciente IN (7397, 7285);
UPDATE pac_antecedentesqui SET idpaciente=7285 WHERE idpaciente=7397;

SELECT * FROM `documentospacientes` WHERE idpaciente IN (7397, 7285);
UPDATE `documentospacientes` SET idpaciente = 7285 WHERE idpaciente= 7397
UPDATE documentospacientes SET cod_hospitalizacion='OZ438582' WHERE cod_hospitalizacion='QC819247'


