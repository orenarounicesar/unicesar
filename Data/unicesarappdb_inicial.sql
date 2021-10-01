
CREATE TABLE `unicesarappdb`.`usuarios` ( `codigo_usuario` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, `login` VARCHAR(50) NOT NULL, `password` VARCHAR(255) NOT NULL, `nombre_usuario` VARCHAR(100) NOT NULL, `codigo_docente` SMALLINT UNSIGNED, `codigo_estudiante` INT UNSIGNED, `activo` BIT NOT NULL DEFAULT 1, PRIMARY KEY (`codigo_usuario`) , INDEX (`login`) , INDEX (`nombre_usuario`) , INDEX (`activo`) , FOREIGN KEY (`codigo_docente`) REFERENCES `unicesarappdb`.`docentes`(`codigo_docente`) ON UPDATE CASCADE ON DELETE CASCADE, FOREIGN KEY (`codigo_estudiante`) REFERENCES `unicesarappdb`.`estudiantes`(`codigo_estudiante`) ON UPDATE CASCADE ON DELETE CASCADE ) ENGINE=INNODB CHARSET=latin1 COLLATE=latin1_spanish_ci; 

