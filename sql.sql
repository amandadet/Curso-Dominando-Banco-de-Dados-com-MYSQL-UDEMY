DELIMITER $
CREATE PROCEDURE verificarpalindromo3(IN palavra VARCHAR(255))
BEGIN
DECLARE palindromo BOOL;
    SET @cont = 1;
    SET @frase = LENGTH(palavra);
    WHILE @frase - @cont > 1 DO
        IF LEFT(@frase, @cont) = RIGHT(palavra,  @frase) THEN
            SET @cont = @cont + 1;
            SET @frase = @frase - 1;
		END IF;
        SET palindromo = True;
    IF LEFT(@frase, @cont) <> RIGHT(palavra,  @frase) THEN
           SET palindromo = False;
    END IF;
    END WHILE ;
SELECT palindromo;
END$
DELIMITER ;

CALL verificarpalindromo3("arara")

