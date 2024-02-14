
-- ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ║   CREACION DE BASE DE DATOS
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

DROP DATABASE IF EXISTS hrflow;
CREATE DATABASE IF NOT EXISTS hrflow;
USE hrflow;

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ║   CREACION DE TABLAS
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE CEAA
-- └───────────────────────────────────────────────────
CREATE TABLE ceaa (
	id_ceaa 				INT AUTO_INCREMENT PRIMARY KEY,
	ceaa_nombre 			VARCHAR(45) NOT NULL,
	ceaa_celular 			VARCHAR(10) NOT NULL,
	ceaa_correo 			VARCHAR(30) NOT NULL,
	ceaa_direc_calle 		VARCHAR(30) NOT NULL,
	ceaa_direc_num 			VARCHAR(10) NOT NULL,
	ceaa_direc_col 			VARCHAR(30) NOT NULL,
	ceaa_direc_mun 			VARCHAR(30) NOT NULL,
	ceaa_direc_estado 		VARCHAR(30) NOT NULL,
	ceaa_direc_cp 			VARCHAR(10) NOT NULL
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE AREAS
-- └───────────────────────────────────────────────────
CREATE TABLE areas (
	id_are 					INT AUTO_INCREMENT PRIMARY KEY,
	are_nombre 				VARCHAR(45) NOT NULL
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE CARGOS
-- └───────────────────────────────────────────────────
CREATE TABLE cargos (
	id_car INT 				AUTO_INCREMENT PRIMARY KEY,
	car_nombre 				VARCHAR(30) NOT NULL,
	car_nivel 				VARCHAR(3) NOT NULL
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE ESTUDIOS
-- └───────────────────────────────────────────────────
CREATE TABLE estudios (
	id_est 					INT AUTO_INCREMENT PRIMARY KEY,
	est_max_estudios 		VARCHAR(20) NOT NULL,
	est_nivel_educacion 	VARCHAR(10) NOT NULL
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE ROLES
-- └───────────────────────────────────────────────────
CREATE TABLE roles (
	id_rol 					INT AUTO_INCREMENT PRIMARY KEY,
	rol_nombre 				VARCHAR(10) NOT NULL
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE PUESTOS
-- └───────────────────────────────────────────────────
CREATE TABLE puestos (
	id_pue 					INT AUTO_INCREMENT PRIMARY KEY,
	pue_desc 				VARCHAR(70) NOT NULL,
	are_id 					INT,
	car_id 					INT,
	FOREIGN KEY (are_id) REFERENCES areas(id_are),
	FOREIGN KEY (car_id) REFERENCES cargos(id_car)
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE EMPLEADOS
-- └───────────────────────────────────────────────────
CREATE TABLE empleados (
	id_emp 					INT PRIMARY KEY,
	emp_paterno 			VARCHAR(25) NOT NULL,
	emp_materno 			VARCHAR(25) NOT NULL,
	emp_nombre_s 			VARCHAR(25) NOT NULL,
	emp_sexo 				ENUM('HOMBRE', 'MUJER') NOT NULL,
	emp_fecha_nacimiento 	DATE NOT NULL,
	emp_curp 				VARCHAR(18) NOT NULL,
	emp_rfc 				VARCHAR(13) NOT NULL,
	emp_celular 			VARCHAR(10) NOT NULL,
	emp_correo 				VARCHAR(30) NOT NULL,
	emp_direc_calle			VARCHAR(30) NOT NULL,
	emp_direc_num 			VARCHAR(10) NOT NULL,
	emp_direc_col 			VARCHAR(30) NOT NULL,
	emp_direc_mun 			VARCHAR(30) NOT NULL,
	emp_direc_estado 		VARCHAR(30) NOT NULL,
	emp_direc_cp 			VARCHAR(10) NOT NULL,
	emp_participa_contrataciones_publicas 	ENUM('SI', 'NO') NOT NULL,
	emp_arch_datos_generales 				BLOB,
	emp_arch_cv_solicitud 					BLOB,
	emp_arch_foto 							BLOB,
	emp_arch_acta_nacimiento 				BLOB,
	emp_arch_comprobante_estudios 			BLOB,
	emp_arch_rfc 							BLOB,
	emp_arch_curp 							BLOB,
	emp_arch_constancia_no_inhabilitacion 	BLOB,
	emp_arch_certificado_medico 			BLOB,
	emp_arch_credencial_elector 			BLOB,
	emp_arch_comprobante_domicilio 			BLOB,
	emp_arch_no_presta_servicios 			BLOB,
	emp_arch_solicitud_apertura_cuenta 		BLOB,
	ceaa_id 				INT,
	pue_id 					INT,
	est_id 					INT,
	usu_id 					INT,
	con_id 					INT
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE CONTRATOS
-- └───────────────────────────────────────────────────
CREATE TABLE contratos (
	id_con 					INT KEY,
	con_categoria 			VARCHAR(15) NOT NULL,
	con_tipo_nomina 		VARCHAR(15) NOT NULL,
	con_fecha_alta 			DATE NOT NULL,
	con_fecha_baja 			DATE,
	emp_id 					INT
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE SALARIOS
-- └───────────────────────────────────────────────────
CREATE TABLE salarios (
	id_sal 					INT AUTO_INCREMENT PRIMARY KEY,
	sal_fecha 				DATE NOT NULL,
	sal_sueldo_mensual 		DECIMAL(10, 2) NOT NULL,
	sal_compensacion_mensual 		DECIMAL(10, 2) NOT NULL,
	sal_honorarios_mensuales 		DECIMAL(10, 2) NOT NULL,
	sal_sueldo_bruto 				DECIMAL(10, 2) NOT NULL,
	sal_sueldo_neto 				DECIMAL(10, 2) NOT NULL,
	sal_fuente_financiamiento 		VARCHAR(10) NOT NULL,
	sal_nombre_fondo 				VARCHAR(25) NOT NULL,
    sal_vales_despensa				DECIMAL(10, 2) NOT NULL,
    sal_utiles_mensual				DECIMAL(10, 2) NOT NULL,
    sal_utiles_anual				DECIMAL(10, 2) NOT NULL,
    sal_ayuda_transporte			DECIMAL(10, 2) NOT NULL,
	sal_observaciones 				TEXT,
	emp_id 							INT
);

-- ┌───────────────────────────────────────────────────
-- |   TABLA DE USUARIOS
-- └───────────────────────────────────────────────────
CREATE TABLE usuarios (
	id_usu 					INT AUTO_INCREMENT PRIMARY KEY,
	usu_contrasena 			VARCHAR(10) NOT NULL,
	rol_id 					INT,
	emp_id 					INT
);

-- ┌───────────────────────────────────────────────────
-- |   LLAVES FORANEAS PARA TABLA EMPLEADOS
-- └───────────────────────────────────────────────────
ALTER TABLE empleados
ADD FOREIGN KEY (ceaa_id) REFERENCES ceaa(id_ceaa),
ADD FOREIGN KEY (pue_id) REFERENCES puestos(id_pue),
ADD FOREIGN KEY (est_id) REFERENCES estudios(id_est),
ADD FOREIGN KEY (con_id) REFERENCES contratos(id_con),
ADD FOREIGN KEY (usu_id) REFERENCES usuarios(id_usu);

-- ┌───────────────────────────────────────────────────
-- |   LLAVES FORANEAS PARA TABLA CONTRATOS
-- └───────────────────────────────────────────────────
ALTER TABLE contratos
ADD FOREIGN KEY (emp_id) REFERENCES empleados(id_emp);

-- ┌───────────────────────────────────────────────────
-- |   LLAVES FORANEAS PARA TABLA USUARIOS
-- └───────────────────────────────────────────────────
ALTER TABLE usuarios
ADD FOREIGN KEY (emp_id) REFERENCES empleados(id_emp),
ADD FOREIGN KEY (rol_id) REFERENCES roles(id_rol);

-- ┌───────────────────────────────────────────────────
-- |   LLAVES FORANEAS PARA TABLA SALARIOS
-- └───────────────────────────────────────────────────
ALTER TABLE salarios
ADD FOREIGN KEY (emp_id) REFERENCES empleados(id_emp);

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ║   INSERCION DE DATOS
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- ┌───────────────────────────────────────────────────
-- |   DATOS PARA LA TABLA CEAA
-- └───────────────────────────────────────────────────
INSERT INTO ceaa (id_ceaa, ceaa_nombre, ceaa_celular, ceaa_correo, ceaa_direc_calle, ceaa_direc_num, ceaa_direc_col, ceaa_direc_mun, ceaa_direc_estado, ceaa_direc_cp) VALUES
(1, 'COMISION ESTATAL DEL AGUA Y ALCANTARILLADO', '1234567890', 'ceaa@ceaa.com', 'Calle Principal', '10', 'Centro', 'Ciudad de México', 'Ciudad de México', '12345');

-- ┌───────────────────────────────────────────────────
-- |   DATOS PARA LA TABLA AREAS
-- └───────────────────────────────────────────────────
INSERT INTO areas (id_are, are_nombre) VALUES
(1, 'COMISIÓN ESTATAL DE AGUA Y ALCANTARILLADO'),
(2, 'GESTIÓN INSTITUCIONAL'),
(3, 'ORGANISMOS OPERADORES Y ATENCIÓN A USUARIOS'),
(4, 'INFRAESTRUCTURA HIDRÁULICA'),
(5, 'JURÍDICA'),
(6, 'INVESTIGACIÓN Y VINCULACIÓN DEL AGUA'),
(7, 'PLANEACIÓN ESTRATÉGICA'),
(8, 'CALIDAD DEL AGUA'),
(9, 'ADMINISTRACIÓN Y FINANZAS'),
(10, 'ENLACE INSTITUCIONAL'),
(11, 'INFORMÁTICA'),
(12, 'GESTIÓN SOCIAL Y SISTEMAS INSTITUCIONALES'),
(13, 'CONTROL DE ARCHIVO'),
(14, 'ATENCIÓN A USUARIOS Y ORGANISMOS OPERADORES'),
(15, 'ATENCIÓN SOCIAL'),
(16, 'ATENCIÓN A USUARIOS'),
(17, 'ATENCIÓN A ORGANISMOS OPERADORES'),
(18, 'CONTRALORÍA SOCIAL'),
(19, 'FORMACIÓN Y CAPACITACIÓN'),
(20, 'CONSTRUCCIÓN DE OBRA URBANA'),
(21, 'CONSTRUCCIÓN DE OBRA RURAL'),
(22, 'RESIDENCIA DE OBRA'),
(23, 'CIERRES DE OBRA'),
(24, 'NORMATIVIDAD'),
(25, 'CONSULTIVO Y CONTENCIOSO'),
(26, 'PLANTAS DE TRATAMIENTO DE AGUA'),
(27, 'RECURSOS HÍDRICOS'),
(28, 'ESTUDIOS Y PROYECTOS'),
(29, 'CONTROL PRESUPUESTAL'),
(30, 'SEGUIMIENTO Y EVALUACIÓN'),
(31, 'LICITACIONES Y PRECIOS UNITARIOS'),
(32, 'ESTUDIOS Y ASESORÍA VACANTE'),
(33, 'PROYECTOS'),
(34, 'PRESUPUESTO'),
(35, 'FONDOS DE INVERSIÓN'),
(36, 'LICITACIONES'),
(37, 'CONTABILIDAD Y FINANZAS'),
(38, 'RECURSOS MATERIALES'),
(39, 'ADMINISTRACIÓN'),
(40, 'DESINFECCIÓN DEL AGUA'),
(41, 'MONITOREO DEL AGUA'),
(42, 'CONTABILIDAD'),
(43, 'DESARROLLO DE PERSONAL'),
(44, 'GESTIÓN DE NÓMINA'),
(45, 'SERVICIOS GENERALES');

-- ┌───────────────────────────────────────────────────
-- |   DATOS PARA LA TABLA CARGOS
-- └───────────────────────────────────────────────────
INSERT INTO cargos (id_car, car_nombre, car_nivel) VALUES 
(1, 'DIRECTOR GENERAL B', '12B'),
(2, 'DIRECTOR DE ÁREA B', '11B'),
(3, '----- DE ÁREA A', '11A'),
(4, '------- DE ÁREA C', '11C'),
(5, 'SUBDIRECTOR DE ÁREA A', '10A'),
(6, '+----- DE DEPARTAMENTO', '9'),
(7, 'JEFE DE DEPARTAMENTO A', '9A'),
(8, 'JEFE DE DEPARTAMENTO B', '9B'),
(9, '---------- DE DEPARTAMENTO C', '9C'),
(10, 'JEFE DE OFICINA A', '8A'),
(11, 'JEFE DE OFICINA B', '8B'),
(12, '-------- DE OFICINA C', '8C'),
(13, '---- DE ÁREA', '7'),
(14, '----- ESPECIALIZADO', '7'),
(15, '---------- DE DIRECTOR DE ÁREA', '6'),
(16, '-------- ADMINISTRATIVO', '6'),
(17, '-------- DE OFICINA', '5'),
(18, '----------', '4');

-- ┌───────────────────────────────────────────────────
-- |   DATOS PARA LA TABLA ESTUDIOS
-- └───────────────────────────────────────────────────
INSERT INTO estudios (id_est, est_max_estudios, est_nivel_educacion) VALUES 
(1, 'PRIMARIA', 'BASICA'),
(2, 'SECUNDARIA', 'BASICA'),
(3, 'BACHILLERATO', 'MEDIA'),
(4, 'CARRERA TÉCNICA', 'MEDIA'),
(5, 'LICENCIATURA', 'SUPERIOR'),
(6, 'MAESTRÍA', 'SUPERIOR'),
(7, 'ESPECIALIZACIÓN', 'SUPERIOR'),
(8, 'DOCTORADO', 'SUPERIOR'),
(9, 'POSDOCTORADO', 'SUPERIOR');

-- ┌───────────────────────────────────────────────────
-- |   DATOS PARA LA TABLA ROLES
-- └───────────────────────────────────────────────────
INSERT INTO roles (id_rol, rol_nombre) VALUES
(1, 'ADMIN'),
(2, 'GENERAL');

-- ┌───────────────────────────────────────────────────
-- |   DATOS PARA LA TABLA PUESTOS
-- └───────────────────────────────────────────────────
INSERT INTO puestos (id_pue, pue_desc, are_id, car_id) VALUES
(1, 'DIRECCIÓN GENERAL DE LA COMISIÓN ESTATAL DE AGUA Y ALCANTARILLADO', 1, 12),
(2, 'DIRECCIÓN DE GESTIÓN INSTITUCIONAL', 2, 11),
(3, 'DIRECCIÓN DE ORGANISMOS OPERADORES Y ATENCIÓN A USUARIOS', 3, 11),
(4, 'DIRECCIÓN DE INFRAESTRUCTURA HIDRÁULICA', 4, 11),
(5, 'DIRECCIÓN DE JURÍDICA', 5, 11),
(6, 'DIRECCIÓN DE INVESTIGACIÓN Y VINCULACIÓN DEL AGUA', 6, 11),
(7, 'DIRECCIÓN DE PLANEACIÓN ESTRATÉGICA', 7, 11),
(8, 'DIRECCIÓN DE CALIDAD DEL AGUA', 8, 11),
(9, 'DIRECCIÓN DE ADMINISTRACIÓN Y FINANZAS', 9, 11),
(10, 'SUBDIRECCIÓN DE ENLACE INSTITUCIONAL', 10, 10),
(11, 'SUBDIRECCIÓN DE INFORMÁTICA', 11, 10),
(12, 'SUBDIRECCIÓN DE GESTIÓN SOCIAL Y SISTEMAS INSTITUCIONALES', 12, 10),
(13, 'DEPARTAMENTO DE CONTROL DE ARCHIVO', 13, 9),
(14, 'SUBDIRECCIÓN DE ATENCIÓN A USUARIOS Y ORGANISMOS OPERADORES', 14, 10),
(15, 'SUBDIRECCIÓN DE ATENCIÓN SOCIAL', 15, 10),
(16, 'DEPARTAMENTO DE ATENCIÓN A USUARIOS', 16, 9),
(17, 'DEPARTAMENTO DE ATENCIÓN A ORGANISMOS OPERADORES', 17, 9),
(18, 'DEPARTAMENTO DE CONTRALORÍA SOCIAL', 18, 9),
(19, 'DEPARTAMENTO DE FORMACIÓN Y CAPACITACIÓN', 19, 9),
(20, 'SUBDIRECCIÓN DE CONSTRUCCIÓN DE OBRA URBANA', 20, 10),
(21, 'SUBDIRECCIÓN DE CONSTRUCCIÓN DE OBRA RURAL', 21, 10),
(22, 'DEPARTAMENTO DE RESIDENCIA DE OBRA', 22, 9),
(23, 'DEPARTAMENTO DE RESIDENCIA DE OBRA', 22, 9),
(24, 'DEPARTAMENTO DE CIERRES DE OBRA', 23, 9),
(25, 'DEPARTAMENTO DE NORMATIVIDAD', 24, 9),
(26, 'DEPARTAMENTO DE CONSULTIVO Y CONTENCIOSO', 25, 9),
(27, 'SUBDIRECCIÓN DE PLANTAS DE TRATAMIENTO DE AGUA', 26, 10),
(28, 'SUBDIRECCIÓN DE RECURSOS HÍDRICOS', 27, 10),
(29, 'SUBDIRECCIÓN DE ESTUDIOS Y PROYECTOS', 28, 10),
(30, 'SUBDIRECCIÓN DE CONTROL PRESUPUESTAL', 29, 10),
(31, 'SUBDIRECCIÓN DE SEGUIMIENTO Y EVALUACIÓN', 30, 10),
(32, 'SUBDIRECCIÓN DE LICITACIONES Y PRECIOS UNITARIOS', 31, 10),
(33, 'DEPARTAMENTO DE RESIDENCIA DE OBRA', 22, 9),
(34, 'DEPARTAMENTO DE ESTUDIOS Y ASESORÍA VACANTE', 32, 9),
(35, 'DEPARTAMENTO DE PROYECTOS', 33, 9),
(36, 'DEPARTAMENTO DE PRESUPUESTO', 34, 9),
(37, 'DEPARTAMENTO DE FONDOS DE INVERSIÓN', 35, 9),
(38, 'DEPARTAMENTO DE LICITACIONES', 36, 9),
(39, 'SUBDIRECCIÓN DE CONTABILIDAD Y FINANZAS', 37, 10),
(40, 'SUBDIRECCIÓN DE RECURSOS MATERIALES', 38, 10),
(41, 'SUBDIRECCIÓN DE ADMINISTRACIÓN', 39, 10),
(42, 'DEPARTAMENTO DE DESINFECCIÓN DEL AGUA', 40, 9),
(43, 'DEPARTAMENTO DE MONITOREO DEL AGUA', 41, 9),
(44, 'DEPARTAMENTO DE CONTABILIDAD', 42, 9),
(45, 'DEPARTAMENTO DE DESARROLLO DE PERSONAL', 43, 9),
(46, 'DEPARTAMENTO DE GESTIÓN DE NOMINA', 44, 9),
(47, 'DEPARTAMENTO DE SERVICIOS GENERALES', 45, 9),
(48, 'DEPARTAMENTO DE RECURSOS MATERIALES', 38, 9);

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ║     CREACION DE PROCEDIMIENTOS ALMACENADOS     
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA INSERTAR EMPLEADOS
-- |   (TABLAS: EMPLEADO, CONTRATO, USUARIO)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_InsEmpleado(
	IN empid INT,
	IN paterno VARCHAR(25),
	IN materno VARCHAR(25),
	IN nombre_s VARCHAR(25),
	IN sexo ENUM('HOMBRE', 'MUJER'),
	IN fecha_nacimiento DATE,
	IN curp VARCHAR(18),
	IN rfc VARCHAR(13),
	IN celular VARCHAR(10),
	IN correo VARCHAR(30),
	IN direc_calle VARCHAR(30),
	IN direc_num VARCHAR(10),
	IN direc_col VARCHAR(30),
	IN direc_mun VARCHAR(30),
	IN direc_estado VARCHAR(30),
	IN direc_cp VARCHAR(10),
	IN participa_contrataciones_publicas ENUM('SI', 'NO'),
	IN arch_datos_generales BLOB,
	IN arch_cv_solicitud BLOB,
	IN arch_foto BLOB,
	IN arch_acta_nacimiento BLOB,
	IN arch_comprobante_estudios BLOB,
	IN arch_rfc BLOB,
	IN arch_curp BLOB,
	IN arch_constancia_no_inhabilitacion BLOB,
	IN arch_certificado_medico BLOB,
	IN arch_credencial_elector BLOB,
	IN arch_comprobante_domicilio BLOB,
	IN arch_no_presta_servicios BLOB,
	IN arch_solicitud_apertura_cuenta BLOB,
	IN categoria VARCHAR(15),
	IN fecha_alta DATE,
	IN fecha_baja DATE,
	IN est INT,
	IN pue INT
)
BEGIN
	DECLARE emp_exists INT;
	DECLARE curp_exists INT;
	DECLARE tipo_nomina VARCHAR(15);
	DECLARE area_pertenece VARCHAR(45);
	DECLARE contrasena VARCHAR(10);
	SELECT COUNT(*) INTO emp_exists FROM empleados WHERE id_emp = empid;
	IF emp_exists = 0 THEN
		SELECT COUNT(*) INTO curp_exists FROM empleados WHERE emp_curp = curp;
		IF curp_exists = 0 THEN
			INSERT INTO empleados (
			id_emp, emp_paterno, emp_materno, emp_nombre_s, emp_sexo, emp_fecha_nacimiento,
			emp_curp, emp_rfc, emp_celular, emp_correo, emp_direc_calle, emp_direc_num,
			emp_direc_col, emp_direc_mun, emp_direc_estado, emp_direc_cp,
			emp_participa_contrataciones_publicas, emp_arch_datos_generales, emp_arch_cv_solicitud,
			emp_arch_foto, emp_arch_acta_nacimiento, emp_arch_comprobante_estudios, emp_arch_rfc,
			emp_arch_curp, emp_arch_constancia_no_inhabilitacion, emp_arch_certificado_medico,
			emp_arch_credencial_elector, emp_arch_comprobante_domicilio, emp_arch_no_presta_servicios,
			emp_arch_solicitud_apertura_cuenta, ceaa_id, pue_id, est_id, usu_id, con_id
			) VALUES (
			empid, paterno, materno, nombre_s, sexo, fecha_nacimiento,
			curp, rfc, celular, correo, direc_calle, direc_num,
			direc_col, direc_mun, direc_estado, direc_cp,
			participa_contrataciones_publicas, arch_datos_generales, arch_cv_solicitud,
			arch_foto, arch_acta_nacimiento, arch_comprobante_estudios, arch_rfc,
			arch_curp, arch_constancia_no_inhabilitacion, arch_certificado_medico,
			arch_credencial_elector, arch_comprobante_domicilio, arch_no_presta_servicios,
			arch_solicitud_apertura_cuenta, 1, pue, est, NULL, NULL
			);
			CASE categoria
				WHEN 'FUNCIONARIO' THEN SET tipo_nomina = 'ESTRUCTURA';
				WHEN 'CONFIANZA' THEN SET tipo_nomina = 'ESTRUCTURA';
				WHEN 'HONORARIOS' THEN SET tipo_nomina = 'HONORARIOS';
				ELSE SET tipo_nomina = '';
			END CASE;
			INSERT INTO contratos (id_con, con_categoria, con_tipo_nomina, con_fecha_alta, con_fecha_baja, emp_id)
			VALUES (empid, categoria, tipo_nomina, fecha_alta, fecha_baja, empid);
			SELECT are_nombre INTO area_pertenece FROM areas
			WHERE id_are = (SELECT are_id FROM puestos WHERE id_pue = pue);
			IF area_pertenece = 'GESTIÓN DE NÓMINA' THEN
				SET contrasena = CONCAT(RIGHT(celular, 4), LEFT(paterno, 4));
				INSERT INTO usuarios (id_usu, usu_contrasena, rol_id, emp_id)
				VALUES (empid, contrasena, 1, empid);
				UPDATE empleados
				SET usu_id = empid
				WHERE id_emp = empid;
			END IF;
			UPDATE empleados 
			SET con_id = empid
			WHERE id_emp = empid;
			SELECT 1; -- Se registro de forma correcta el empleado
		ELSE
			SELECT 2; -- Existe un empleado con el mismo CURP
		END IF;
	ELSE
		SELECT 0; -- Existe un empleado con el mismo ID
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_InsEmpleado
-- └───────────────────────────────────────────────────
CALL sp_InsEmpleado(
	8, 'Cruz', 'Suárez', 'Arturo', 'HOMBRE', '1995-03-15', 'CURP11111111111111', 'RFC1111111111',
	'9876543211', 'arturo@example.com', 'Calle Tercera', '25', 'Centro', 'Ciudad de México',
	'Ciudad de México', '54321', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'FUNCIONARIO', '2023-09-20', NULL, 6, 46
);
CALL sp_InsEmpleado(
	15, 'Martinez', 'Santos', 'Lucia', 'MUJER', '1992-08-10', 'CURP22222222222222', 'RFC2222222222',
	'9876543212', 'lucia@example.com', 'Calle Cuarta', '10', 'Norte', 'Ciudad de México',
	'Ciudad de México', '67890', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'CONFIANZA', '2023-10-05', NULL, 8, 3
);
CALL sp_InsEmpleado(
	28, 'Gutierrez', 'Vega', 'Johan', 'HOMBRE', '1988-12-03', 'CURP33333333333333', 'RFC3333333333',
	'9876543213', 'pedro@example.com', 'Calle Quinta', '18', 'Sur', 'Ciudad de México',
	'Ciudad de México', '98765', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'HONORARIOS', '2023-11-15', NULL, 5, 28
);
CALL sp_InsEmpleado(
	42, 'Gonzalez', 'Mendez', 'Isabel', 'MUJER', '1990-06-20', 'CURP44444444444444', 'RFC4444444444',
	'9876543214', 'isabel@example.com', 'Calle Sexta', '30', 'Este', 'Ciudad de México',
	'Ciudad de México', '87654', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'CONFIANZA', '2023-07-25', NULL, 4, 46
);
CALL sp_InsEmpleado(
	11, 'Vasquez', 'Perez', 'Mario', 'HOMBRE', '1993-04-05', 'CURP55555555555555', 'RFC5555555555',
	'9876543215', 'mario@example.com', 'Calle Séptima', '22', 'Oeste', 'Ciudad de México',
	'Ciudad de México', '76543', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'HONORARIOS', '2023-06-30', NULL, 9, 22
);
CALL sp_InsEmpleado(
	89, 'Rodriguez', 'Luna', 'Giselle', 'MUJER', '1985-11-12', 'CURP66666666666666', 'RFC6666666666',
	'9876543216', 'laura@example.com', 'Calle Octava', '15', 'Centro', 'Ciudad de México',
	'Ciudad de México', '65432', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'FUNCIONARIO', '2023-02-10', NULL, 7, 4
);
CALL sp_InsEmpleado(
	36, 'Sanchez', 'Martinez', 'Roberto', 'HOMBRE', '1987-09-25', 'CURP77777777777777', 'RFC7777777777',
	'9876543217', 'roberto@example.com', 'Calle Novena', '12', 'Norte', 'Ciudad de México',
	'Ciudad de México', '54321', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'HONORARIOS', '2023-04-15', NULL, 6, 31
);
CALL sp_InsEmpleado(
	75, 'Lara', 'Gutierrez', 'Ricardo', 'HOMBRE', '1986-07-08', 'CURP88888888888888', 'RFC8888888888',
	'9876543218', 'ricardo@example.com', 'Calle Décima', '28', 'Sur', 'Ciudad de México',
	'Ciudad de México', '98765', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'FUNCIONARIO', '2023-03-20', NULL, 8, 38
);
CALL sp_InsEmpleado(
	19, 'Fernandez', 'Castro', 'Ana', 'MUJER', '1991-01-30', 'CURP99999999999999', 'RFC9999999999',
	'9876543219', 'ana@example.com', 'Calle Onceava', '24', 'Este', 'Ciudad de México',
	'Ciudad de México', '87654', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'CONFIANZA', '2023-08-05', '2023-10-24', 5, 19
);
CALL sp_InsEmpleado(
	55, 'Perez', 'Lopez', 'Javier', 'HOMBRE', '1989-05-18', 'CURP10101010101010', 'RFC1010101010',
	'9876543220', 'javier@example.com', 'Calle Doceava', '16', 'Oeste', 'Ciudad de México',
	'Ciudad de México', '76543', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'HONORARIOS', '2023-01-12', '2022-12-08', 9, 25
);

SELECT * FROM empleados;
SELECT * FROM contratos;
SELECT * FROM usuarios;

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA MODIFICAR EMPLEADOS
-- |   (TABLAS: EMPLEADO, CONTRATO, USUARIO)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_UpdEmpleado(
	IN empid INT,
	IN paterno VARCHAR(25),
	IN materno VARCHAR(25),
	IN nombre_s VARCHAR(25),
	IN sexo ENUM('HOMBRE', 'MUJER'),
	IN fecha_nacimiento DATE,
	IN curp VARCHAR(18),
	IN rfc VARCHAR(13),
	IN celular VARCHAR(10),
	IN correo VARCHAR(30),
	IN direc_calle VARCHAR(30),
	IN direc_num VARCHAR(10),
	IN direc_col VARCHAR(30),
	IN direc_mun VARCHAR(30),
	IN direc_estado VARCHAR(30),
	IN direc_cp VARCHAR(10),
	IN participa_contrataciones_publicas ENUM('SI', 'NO'),
	IN arch_datos_generales BLOB,
	IN arch_cv_solicitud BLOB,
	IN arch_foto BLOB,
	IN arch_acta_nacimiento BLOB,
	IN arch_comprobante_estudios BLOB,
	IN arch_rfc BLOB,
	IN arch_curp BLOB,
	IN arch_constancia_no_inhabilitacion BLOB,
	IN arch_certificado_medico BLOB,
	IN arch_credencial_elector BLOB,
	IN arch_comprobante_domicilio BLOB,
	IN arch_no_presta_servicios BLOB,
	IN arch_solicitud_apertura_cuenta BLOB,
	IN categoria VARCHAR(15),
	IN fecha_alta DATE,
	IN fecha_baja DATE,
	IN est INT,
	IN pue INT
)
BEGIN
	DECLARE curp_exists INT;
	DECLARE tipo_nomina VARCHAR(15);
	DECLARE area_pertenece VARCHAR(45);
	DECLARE emp_has_user INT;
	DECLARE contrasena VARCHAR(10);
	SELECT COUNT(*) INTO curp_exists FROM empleados WHERE emp_curp = curp AND id_emp <> empid;
	IF curp_exists = 0 THEN
		UPDATE empleados
		SET emp_paterno = paterno,
			emp_materno = materno,
			emp_nombre_s = nombre_s,
			emp_sexo = sexo,
			emp_fecha_nacimiento = fecha_nacimiento,
			emp_curp = curp,
			emp_rfc = rfc,
			emp_celular = celular,
			emp_correo = correo,
			emp_direc_calle = direc_calle,
			emp_direc_num = direc_num,
			emp_direc_col = direc_col,
			emp_direc_mun = direc_mun,
			emp_direc_estado = direc_estado,
			emp_direc_cp = direc_cp,
			emp_participa_contrataciones_publicas = participa_contrataciones_publicas,
			emp_arch_datos_generales = arch_datos_generales,
			emp_arch_cv_solicitud = arch_cv_solicitud,
			emp_arch_foto = arch_foto,
			emp_arch_acta_nacimiento = arch_acta_nacimiento,
			emp_arch_comprobante_estudios = arch_comprobante_estudios,
			emp_arch_rfc = arch_rfc,
			emp_arch_curp = arch_curp,
			emp_arch_constancia_no_inhabilitacion = arch_constancia_no_inhabilitacion,
			emp_arch_certificado_medico = arch_certificado_medico,
			emp_arch_credencial_elector = arch_credencial_elector,
			emp_arch_comprobante_domicilio = arch_comprobante_domicilio,
			emp_arch_no_presta_servicios = arch_no_presta_servicios,
			emp_arch_solicitud_apertura_cuenta = arch_solicitud_apertura_cuenta,
			ceaa_id = 1,
			pue_id = pue,
			est_id = est
		WHERE id_emp = empid;
		CASE categoria
			WHEN 'FUNCIONARIO' THEN SET tipo_nomina = 'ESTRUCTURA';
			WHEN 'CONFIANZA' THEN SET tipo_nomina = 'ESTRUCTURA';
			WHEN 'HONORARIOS' THEN SET tipo_nomina = 'HONORARIOS';
			ELSE SET tipo_nomina = '';
		END CASE;
		UPDATE contratos
		SET con_categoria = categoria,
			con_tipo_nomina = tipo_nomina,
			con_fecha_alta = fecha_alta,
			con_fecha_baja = fecha_baja
		WHERE emp_id = empid;
		SELECT are_nombre INTO area_pertenece FROM areas
		WHERE id_are = (SELECT are_id FROM puestos WHERE id_pue = pue);
		IF area_pertenece != 'GESTIÓN DE NÓMINA' THEN
			UPDATE empleados
			SET usu_id = null
			WHERE id_emp = empid;
			DELETE FROM usuarios WHERE emp_id = empid;
		ELSE
			SELECT COUNT(*) INTO emp_has_user FROM usuarios WHERE emp_id = empid;
			IF emp_has_user = 0 THEN
				SET contrasena = CONCAT(RIGHT(celular, 4), LEFT(paterno, 4));
				INSERT INTO usuarios (id_usu, usu_contrasena, rol_id, emp_id)
				VALUES (empid, contrasena, 1, empid);
				UPDATE empleados 
				SET usu_id = empid
				WHERE id_emp = empid;
			END IF;
		END IF;
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_UpdEmpleado
-- └───────────────────────────────────────────────────
CALL sp_UpdEmpleado(
	8, 'García', 'López', 'Ana María', 'MUJER', '1988-05-12', 'GALM880512MCMRCN05', 'GALA880512123',
	'5557890123', 'ana.garcia@example.com', 'Calle de la Rosa', '123', 'Colonia del Valle', 'Ciudad de México',
	'Ciudad de México', '03100', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'CONFIANZA', '2018-06-15', NULL, 6, 4
);
CALL sp_UpdEmpleado(
	15, 'Martínez', 'Santos', 'Lucía Patricia', 'MUJER', '1992-08-10', 'MAPL920810MCMLCT09', 'MAPL920810123',
	'5559876543', 'lucia.martinez@example.com', 'Avenida Reforma', '567', 'Polanco', 'Ciudad de México',
	'Ciudad de México', '11560', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'CONFIANZA', '2019-02-20', NULL, 8, 46
);
CALL sp_UpdEmpleado(
	28, 'Hernández', 'Vega', 'Pedro Antonio', 'HOMBRE', '1985-11-23', 'HEVP851123HMCRRR09', 'HEVP851123123',
	'5551234567', 'pedro.hernandez@example.com', 'Calle del Bosque', '45', 'Bosques de las Lomas', 'Ciudad de México',
	'Ciudad de México', '05120', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, 'HONORARIOS', '2020-03-10', '2022-12-31', 5, 28
);

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA ELIMINAR EMPLEADOS
-- |   (TABLAS: EMPLEADO, CONTRATO, USUARIO)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_DelEmpleado(
	IN empid INT
)
BEGIN
	DECLARE emp_exists INT;
	SELECT COUNT(*) INTO emp_exists FROM empleados WHERE id_emp = empid;
	IF emp_exists > 0 THEN
		UPDATE empleados
		SET usu_id = null,
			con_id = null
		WHERE id_emp = empid;
		UPDATE contratos
		SET emp_id = null
		WHERE emp_id = empid;
		UPDATE usuarios
		SET emp_id = null
		WHERE emp_id = empid;
		DELETE FROM empleados WHERE id_emp = empid;
		DELETE FROM contratos WHERE id_con = empid;
		DELETE FROM usuarios WHERE id_usu = empid;
		SELECT 1;
	ELSE
		SELECT 0;
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_DelEmpleado
-- └───────────────────────────────────────────────────
-- CALL spDelEmpleado(15);
CALL sp_DelEmpleado(75);
CALL sp_DelEmpleado(89);

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA CONTROL DE ACCESO
-- |   (NUMERO DE EMPLEADO Y CONTRASEÑA)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_Acceso
(
	IN emp_id INT,
	IN contrasena VARCHAR(20)
)
BEGIN
	IF EXISTS (
		SELECT 1
		FROM empleados e
		INNER JOIN usuarios u ON e.usu_id = u.id_usu
		WHERE e.id_emp = emp_id AND u.usu_contrasena = contrasena
	) THEN 
		SELECT 1;
	ELSE
		SELECT 0;
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_Acceso
-- └───────────────────────────────────────────────────
CALL sp_Acceso('8', '0123Garc');
CALL sp_Acceso('15', '6543Mart');
CALL sp_Acceso('42', '3214Gonz');

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA SALARIO CON VALES
-- |   (EMPLEADO Y VALES DE DESPENSA Y UTILES)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_InsSalarioConVales(
	IN emp_id INT,
	IN fecha DATE,
	IN sueldo_mensual DECIMAL(10, 2),
	IN compensacion_mensual DECIMAL(10, 2),
	IN honorarios_mensuales DECIMAL(10, 2),
	IN sueldo_bruto DECIMAL(10, 2),
	IN sueldo_neto DECIMAL(10, 2),
	IN fuente_financiamiento VARCHAR(10),
	IN nombre_fondo VARCHAR(25),
	IN observaciones TEXT
)
BEGIN
	DECLARE car_id INT;
	DECLARE vales_despensa DECIMAL(10, 2);
	DECLARE vales_utiles DECIMAL(10, 2);
	-- Obtener id_car a partir de id_pue
	SELECT p.car_id
	FROM puestos p
	JOIN empleados e ON p.id_pue = e.pue_id
	WHERE e.id_emp = emp_id
	INTO car_id;
	-- Asignar monto de vales de despensa según el car_id
	CASE
    WHEN car_id BETWEEN 1 AND 5 THEN
		SET vales_despensa = 1400; -- Asignar 1400 para los cargos con id entre 1 y 5
    ELSE
		SET vales_despensa = 0; -- Para los demás cargos, no asignar vales de despensa
	END CASE;
	-- Asignar monto de vales de utilidades según el car_id
	CASE
	WHEN car_id BETWEEN 1 AND 5 THEN
		SET vales_utiles = 1000; -- Asignar 1000 para los cargos con id entre 1 y 5
    ELSE
		SET vales_utiles = 0; -- Para los demás cargos, no asignar vales de utilidades
	END CASE;
	-- Verificar si el empleado existe
	IF EXISTS (SELECT 1 FROM empleados WHERE id_emp = emp_id) THEN
		-- Insertar salario
		INSERT INTO salarios (
		sal_fecha,
		sal_sueldo_mensual,
		sal_compensacion_mensual,
		sal_honorarios_mensuales,
		sal_sueldo_bruto,
		sal_sueldo_neto,
		sal_fuente_financiamiento,
		sal_nombre_fondo,
		sal_observaciones,
		sal_vales_de_despensa,
		sal_vales_de_utiles,
		emp_id
		) VALUES (
		fecha,
		sueldo_mensual,
		compensacion_mensual,
		honorarios_mensuales,
		sueldo_bruto,
		sueldo_neto,
		fuente_financiamiento,
		nombre_fondo,
		observaciones,
		vales_despensa,
		vales_utiles,
		emp_id
		);
		SELECT 1; -- Éxito al insertar el salario
	ELSE
		SELECT 0; -- El empleado no existe
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_InsSalarioConVales
-- └───────────────────────────────────────────────────
CALL sp_InsSalarioConVales(
	1,                   -- emp_id
	CURDATE(),           -- fecha actual
	3000.00,             -- sueldo_mensual
	500.00,              -- compensacion_mensual
	200.00,              -- honorarios_mensuales
	3700.00,             -- sueldo_bruto
	3200.00,             -- sueldo_neto
	'Fuente123',         -- fuente_financiamiento
	'FondoXYZ',          -- nombre_fondo
	'Observaciones de prueba' -- observaciones
);

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA MODIFICAR SALARIO
-- |   (EMPLEADO)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_UpdSalarioConVales(
	IN emp_id INT,
	IN fecha DATE,
	IN sueldo_mensual DECIMAL(10, 2),
	IN compensacion_mensual DECIMAL(10, 2),
	IN honorarios_mensuales DECIMAL(10, 2),
	IN sueldo_bruto DECIMAL(10, 2),
	IN sueldo_neto DECIMAL(10, 2),
	IN fuente_financiamiento VARCHAR(10),
	IN nombre_fondo VARCHAR(25),
	IN observaciones TEXT,
	IN car_id INT
)
BEGIN
	DECLARE vales_despensa DECIMAL(10, 2);
	DECLARE vales_utiles DECIMAL(10, 2);
	-- Asignar monto de vales de despensa según el car_id
	CASE
    WHEN car_id BETWEEN 1 AND 5 THEN
		SET vales_despensa = 1400; -- Asignar 1400 para los cargos con id entre 1 y 5
    ELSE
		SET vales_despensa = 0; -- Para los demás cargos, no asignar vales de despensa
	END CASE;
	-- Asignar monto de vales de utilidades según el car_id
	CASE
    WHEN car_id BETWEEN 1 AND 5 THEN
		SET vales_utiles = 1000; -- Asignar 1000 para los cargos con id entre 1 y 5
    ELSE
		SET vales_utiles = 0; -- Para los demás cargos, no asignar vales de utilidades
	END CASE;
	-- Verificar si el empleado existe
	IF EXISTS (SELECT 1 FROM empleados WHERE id_emp = emp_id) THEN
		-- Modificar salario existente
		UPDATE salarios
		SET sal_fecha = fecha,
			sal_sueldo_mensual = sueldo_mensual,
			sal_compensacion_mensual = compensacion_mensual,
			sal_honorarios_mensuales = honorarios_mensuales,
			sal_sueldo_bruto = sueldo_bruto,
			sal_sueldo_neto = sueldo_neto,
			sal_fuente_financiamiento = fuente_financiamiento,
			sal_nombre_fondo = nombre_fondo,
			sal_observaciones = observaciones,
			sal_vales_de_despensa = vales_despensa,
			sal_vales_de_utiles = vales_utiles
		WHERE emp_id = emp_id;
		SELECT 1; -- Éxito al modificar el salario
	ELSE
		SELECT 0; -- El empleado no existe
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_UpdSalarioConVales
-- └───────────────────────────────────────────────────
CALL sp_UpdSalarioConVales(
	1, -- emp_id
	'2023-01-01', -- fecha
	5000.00, -- sueldo_mensual
	1000.00, -- compensacion_mensual
	200.00, -- honorarios_mensuales
	6200.00, -- sueldo_bruto
	5500.00, -- sueldo_neto
	'Financia', -- fuente_financiamiento
	'Fondo A', -- nombre_fondo
	'Observaciones sobre el salario', -- observaciones
	3 -- car_id
);

-- ┌───────────────────────────────────────────────────
-- |   PROCEDIMIENTO PARA BORRAR SALARIO
-- |   (USUARIOS)
-- └───────────────────────────────────────────────────
DELIMITER $$
CREATE PROCEDURE sp_DelSalario(
	IN emp_id INT
)
BEGIN
	-- Verificar si el empleado existe
	IF EXISTS (SELECT 1 FROM empleados WHERE id_emp = emp_id) THEN
		-- Borrar salario asociado al empleado
		DELETE FROM salarios WHERE emp_id = emp_id;
		SELECT 1; -- Éxito al borrar el salario
	ELSE
		SELECT 0; -- El empleado no existe
	END IF;
END $$
DELIMITER ;

-- ┌───────────────────────────────────────────────────
-- |   USO DEL PROCEDIMIENTO sp_DelSalario
-- └───────────────────────────────────────────────────
CALL sp_DelSalario(1);  -- Donde 1 es el emp_id del empleado que deseas borrar el salario

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ║   CREACION DE VISTAS
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ┌───────────────────────────────────────────────────
-- |   USUARIOS
-- |   (CORREO Y CONTRASEÑA)
-- └───────────────────────────────────────────────────
CREATE VIEW vw_usuario AS
SELECT id_emp,
		emp_nombre_s,
		emp_correo,
		usu_contrasena
FROM empleados e
JOIN usuarios u ON id_emp = emp_id;

SELECT * FROM vw_usuario;
