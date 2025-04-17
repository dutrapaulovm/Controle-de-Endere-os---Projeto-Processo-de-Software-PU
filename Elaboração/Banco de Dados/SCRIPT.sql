-- SELECT host, user FROM mysql.user;
drop schema if exists `controleenderecos`;

CREATE SCHEMA IF NOT EXISTS `controleenderecos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `controleenderecos`;

DROP USER IF EXISTS 'admin'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Gx%ZI1@khU6OWhr$716';
GRANT ALL PRIVILEGES ON controleenderecos.* TO 'admin'@'localhost' IDENTIFIED BY 'Gx%ZI1@khU6OWhr$716';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS usuarios (
  `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,          
  `nome` VARCHAR(300) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `salt` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',  
  `password` VARCHAR(256) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `login` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `email` VARCHAR(64) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `data`  DATETIME NOT NULL DEFAULT current_timestamp,   
  `status` VARCHAR(1) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',    
  `telefone` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',  
  UNIQUE INDEX `login` (`login` ASC), 
  UNIQUE INDEX `email` (`email` ASC) );

CREATE TABLE IF NOT EXISTS `controleenderecos`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `uf` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `controleenderecos`.`estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `sigla` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  PRIMARY KEY (`id`));

-- -----------------------------------------------------
-- Table `controleenderecos`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controleenderecos`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `email` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `telefone` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `rua` VARCHAR(300) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `bairro` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `numero` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `cep` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `idcidade` INT NOT NULL DEFAULT 0,
  `cidade` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `idestado` INT NOT NULL,
  `estado` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `uf` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email`));

CREATE TABLE IF NOT EXISTS `controleenderecos`.`endereco` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idcliente` INT(11) NOT NULL,
  `tipo_endereco` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `rua` VARCHAR(300) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `bairro` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `numero` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `cep` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',  
  `idcidade` INT NOT NULL,
  `cidade` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `idestado` INT NOT NULL,
  `estado` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  `sigla` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),  
  CONSTRAINT `fk_endereco_cidade`
    FOREIGN KEY (`idcidade`)
    REFERENCES `controleenderecos`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_estado`
    FOREIGN KEY (`idestado`)
    REFERENCES `controleenderecos`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_cliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `controleenderecos`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `controleenderecos`.`estado` (`nome`, `sigla`) VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amapá', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Santa Catarina', 'SC'),
('São Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');    
    
INSERT INTO `controleenderecos`.`cidade` (`nome`, `uf`) VALUES
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Brasília', 'DF'),
('Salvador', 'BA'),
('Fortaleza', 'CE'),
('Curitiba', 'PR'),
('Manaus', 'AM'),
('Recife', 'PE'),
('Porto Alegre', 'RS'),
('Goiânia', 'GO'),
('Belém', 'PA'),
('São Luís', 'MA'),
('Maceió', 'AL'),
('Natal', 'RN'),
('Campo Grande', 'MS'),
('Cuiabá', 'MT'),
('João Pessoa', 'PB'),
('Aracaju', 'SE'),
('Florianópolis', 'SC'),
('Teresina', 'PI'),
('Vitória', 'ES'),
('Macapá', 'AP'),
('Rio Branco', 'AC'),
('Boa Vista', 'RR'),
('Palmas', 'TO'),
('Santos', 'SP'),
('Campinas', 'SP'),
('Niterói', 'RJ'),
('Sorocaba', 'SP'),
('Uberlândia', 'MG'),
('Londrina', 'PR'),
('Joinville', 'SC'),
('Ribeirão Preto', 'SP'),
('Juiz de Fora', 'MG'),
('São José dos Campos', 'SP'),
('Maringá', 'PR'),
('Blumenau', 'SC'),
('Petrópolis', 'RJ'),
('Caxias do Sul', 'RS'),
('Volta Redonda', 'RJ'),
('Araraquara', 'SP'),
('Tubarão', 'SC'),
('Anápolis', 'GO'),
('Pelotas', 'RS'),
('Bauru', 'SP'),
('Vila Velha', 'ES'),
('Ipatinga', 'MG'),
('Cascavel', 'PR'),
('Mossoró', 'RN');  