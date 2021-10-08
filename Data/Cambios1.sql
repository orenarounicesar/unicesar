
CREATE TABLE `unicesarappdb`.`usuarios` ( `codigo_usuario` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, `login` VARCHAR(50) NOT NULL, `password` VARCHAR(255) NOT NULL, `nombre_usuario` VARCHAR(100) NOT NULL, `codigo_docente` SMALLINT UNSIGNED, `codigo_estudiante` INT UNSIGNED, `activo` BIT NOT NULL DEFAULT 1, PRIMARY KEY (`codigo_usuario`) , INDEX (`login`) , INDEX (`nombre_usuario`) , INDEX (`activo`) , FOREIGN KEY (`codigo_docente`) REFERENCES `unicesarappdb`.`docentes`(`codigo_docente`) ON UPDATE CASCADE ON DELETE CASCADE, FOREIGN KEY (`codigo_estudiante`) REFERENCES `unicesarappdb`.`estudiantes`(`codigo_estudiante`) ON UPDATE CASCADE ON DELETE CASCADE ) ENGINE=INNODB CHARSET=latin1 COLLATE=latin1_spanish_ci; 
ALTER TABLE `unicesarappdb`.`estudiantes` CHANGE `activo` `activo` BIT(1) DEFAULT 1 NOT NULL; 
CREATE TABLE `unicesarappdb`.`cortes_fechas` ( `codigo_corte_fecha` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, `codigo_corte` SMALLINT UNSIGNED NOT NULL, `fecha` DATETIME NOT NULL, PRIMARY KEY (`codigo_corte_fecha`) , UNIQUE INDEX (`codigo_corte` , `fecha`) , FOREIGN KEY (`codigo_corte`) REFERENCES `unicesarappdb`.`cortes`(`codigo_corte`) ON UPDATE CASCADE ON DELETE CASCADE ) ENGINE=INNODB CHARSET=latin1 COLLATE=latin1_spanish_ci; 
ALTER TABLE `unicesarappdb`.`cortes` CHANGE `nombre_nombre` `nombre_corte` VARCHAR(255) CHARSET latin1 COLLATE latin1_spanish_ci NOT NULL, DROP INDEX `nombre_nombre`, ADD KEY `nombre_nombre` (`nombre_corte`) VISIBLE; 
ALTER TABLE `unicesarappdb`.`cortes_fechas` ADD COLUMN `semestre` TINYINT DEFAULT 1 NOT NULL AFTER `codigo_corte`, ADD COLUMN `actual` BIT DEFAULT 1 NOT NULL AFTER `fecha`, DROP INDEX `codigo_corte`, ADD UNIQUE INDEX (`codigo_corte` , `semestre` , `fecha`) , ADD INDEX (`actual`) , DROP FOREIGN KEY `cortes_fechas_ibfk_1`, ADD FOREIGN KEY (`codigo_corte`) REFERENCES `unicesarappdb`.`cortes`(`codigo_corte`) ON UPDATE CASCADE ON DELETE CASCADE; 
ALTER TABLE `unicesarappdb`.`notas` ADD COLUMN `publicada` BIT DEFAULT 0 NOT NULL AFTER `nota`, ADD INDEX (`publicada`); 
ALTER TABLE `unicesarappdb`.`cortes` ADD COLUMN `ultimo_corte` BIT DEFAULT 0 NOT NULL AFTER `porcentaje`, ADD INDEX (`ultimo_corte`); 

