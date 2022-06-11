-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: express_game
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Videojuego'),(2,'Consola'),(3,'Mando');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'Albert Andre','Palacios Carrillo','12348659');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detventa`
--

DROP TABLE IF EXISTS `detventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detventa` (
  `idDetVenta` int NOT NULL AUTO_INCREMENT,
  `idVenta` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `importe` decimal(15,2) NOT NULL,
  PRIMARY KEY (`idDetVenta`),
  KEY `idVenta_idx` (`idVenta`),
  KEY `idProducto_idx` (`idProducto`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `idVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detventa`
--

LOCK TABLES `detventa` WRITE;
/*!40000 ALTER TABLE `detventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidor`
--

DROP TABLE IF EXISTS `distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidor` (
  `idDistribuidor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  PRIMARY KEY (`idDistribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidor`
--

LOCK TABLES `distribuidor` WRITE;
/*!40000 ALTER TABLE `distribuidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `idEmpresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Sony'),(2,'Microsoft'),(3,'Nintendo Company');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma` (
  `idPlataforma` int NOT NULL AUTO_INCREMENT,
  `idEmpresa` int NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`idPlataforma`),
  KEY `idEmpresa_idx` (`idEmpresa`),
  CONSTRAINT `idEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES (1,3,'Nintendo'),(2,1,'PlayStation'),(3,2,'Xbox');
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `idSubCategoria` int NOT NULL,
  `idPlataforma` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `especificacion` text NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `imagenRuta` varchar(250) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `idSubCategoria_idx` (`idSubCategoria`),
  KEY `idPlataforma_idx` (`idPlataforma`),
  CONSTRAINT `idPlataforma` FOREIGN KEY (`idPlataforma`) REFERENCES `plataforma` (`idPlataforma`),
  CONSTRAINT `idSubCategoria` FOREIGN KEY (`idSubCategoria`) REFERENCES `subcategoria` (`idSubCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,7,2,'PlayStation 4 Slim','Los mejores juegos, TV, música y mucho más. Conéctate con tus amigos para transmitir y celebrar tus momentos épicos pulsando el botón Share para Twitch, YouTube, Facebook y Twitter. Juega en línea con tus amigos, obtén juegos gratis, guarda juegos en línea y más con la membresía de PlayStation Plus (se vende por separado).','Capacidad de almacenamiento: 1 TB&Procesador: AMD Jaguar&Entradas USB : 1&Entradas HDMI: 1&Conectividad: USB&Modelo: P-27452573-H',1699.00,'PlayStation4Slim.webp','P6734O'),(2,7,2,'PlayStation 4 Pro','Disfruta de un mayor nivel de inmersión en los títulos de PS4 más vertiginosos y explosivos con la velocidad de fotogramas (FPS) mejorada en una gama de juegos optimizados para PS4 Pro. Todo esto gracias a la potencia adicional de PS4 Pro.','Capacidad de almacenamiento: 1TB&Procesador: AMD&Entradas USB: 3&Entradas HDMI: 1&Conectividad: WiFi&Modelo: 711719510437',2399.00,'PlayStation4Pro.webp','P6735O'),(3,10,3,'Xbox Series X','La Xbox más rapida y potente de la historia. Los juegos creados con el kit de desarrollo de Xbox Series X-S ofrecen tiempos de carga significativamente reducidos y efectos visuales sorprendentes a hasta 120 FPS.','Capacidad de almacenamiento: 1TB&Conectividad: WiFi/Ethernet&Entradas HDMI: 1&Entradas USB: 3&Procesador: AMD',3599.00,'XboxSeriesX.webp','P6736O'),(4,9,1,'Nintendo Switch','Consola de VideojuegosLa consola Nintendo Switch está diseñada para acompañarte dondequiera que vayas, transformándose de consola para el hogar a consola portátil en un instante. Así tendrás más ocasiones para disfrutar de tus juegos favoritos como más te guste.','Capacidad de almacenamiento: 32GB&Conectividad: WiFi&Entradas HDMI: 1&Entradas USB: Sin entradas&Procesador: Linux',1899.00,'NintendoSwitch.webp','P6737O'),(5,9,1,'Nitendo Switch Oled','La consola Nintendo Switch está diseñada para acompañarte dondequiera que vayas, transformándose de consola para el hogar a consola portátil en un instante. Así tendrás más ocasiones para disfrutar de tus juegos favoritos como más te guste.','Capacidad de almacenamiento: 64GB&Conectividad: WiFi/Bluetooth&Entradas HDMI: 1&Entradas USB: Sin entradas&Procesador: Nvidia Tegra',2499.00,'NintendoSwitchOled.webp','P6738O'),(6,8,2,'PlayStation 5','Experimenta una carga increíblemente rápida con un SSD de ultra alta velocidad, inmersión más profunda con soporte para retroalimentación háptica, disparadores adaptativos y audio 3D, y una nueva generación de increíbles juegos de PlayStation.','Capacidad de almacenamiento: 825GB&Conectividad Wi Fi: Sí&Puertos HDMI: 1&Puertos USB: 3&Tipo de lectora: Blu-ray&Puerto Ethernet: Sí',3599.00,'PlayStation5.webp','P6739O'),(7,8,2,'PlayStation 5 Digital Edition','Experimenta una carga increíblemente rápida con un SSD de ultra alta velocidad, inmersión más profunda con soporte para retroalimentación háptica, disparadores adaptativos y audio 3D, y una nueva generación de increíbles juegos de PlayStation. La PS5 edición digital es una versión completamente digital de la consola PS5 que no trae unidad de disco.','Capacidad de almacenamiento: 825GB&Entradas HDMI: Si&Wifi: Si&Puerto Ethernet: Sí',3149.00,'PlayStation5VersionDigital.webp','P6731O'),(8,13,1,'Nintendo Joycon','Un mando o dos, en vertical o en horizontal, control por movimiento o mediante botones. Con los nuevos mandos Joy-Con para Nintendo Switch tendrás flexibilidad total a la hora de jugar y descubrirás nuevas formas de interactuar que transformarán por completo tus experiencias de juego.','Compatibilidad: Nintendo Switch&Batería: Batería recargable&Conectividad: Nintendo Switch',259.00,'Joycon.webp','S8674A'),(9,14,2,'Mando DualSense','Siente la respuesta física a tus acciones en el juego con los accionadores dobles que reemplazan a los tradicionales motores de vibración. En tus manos, estas vibraciones dinámicas pueden simular la sensación de todo, desde los entornos hasta el retroceso de diferentes armas.','Color: Blanco&Medidas: 14cm x 5cm x 18cm&Puertos USB: Tipo C&Incluye cable de alimentación: Sí',339.00,'MandoDualsense.webp','S8675A'),(10,12,2,'Mando DualShock','El mando Dualshock 4 es el control perfecto para una nueva generación de gamers. Juega como si estuvieses dentro de la historia, gracias a sus potentes sensores de movimiento.','Conexión: Bluetooth&Compatibilidad: PS4&Batería: Sí&Dimensiones: 18cm x 19cm x 8cm',259.00,'MandoDualshock.webp','S8676A'),(11,11,3,'Mando Xbox One Series X','El mando xbox one series x experimenta el diseño modernizado del control inalámbrico Xbox, con superficies moldeadas y una geometría refinada para una mayor comodidad durante el juego. El control xbox series x te permite jugar de manera inalámbrica o utiliza el cable USB-C incluido para una experiencia de juego con cable.','Modelo: Mando Pc&Hecho en: China&Inalámbrico: Sí&Tipo: Controles remotos&Alto: 17cm&Ancho: 8cm&Largo: 12cm&Peso: 0,43g',339.00,'XboxController.webp','S8677A'),(12,6,1,'Super Mario Odyssey','Ayuda a Mario a recoger lunas que servirán de combustible a su aeronave, la Odyssey, y también a rescatar a la princesa Peach de las garras de Bowser. Mario llega con nuevos movimientos gracias a Cappy, su nuevo sombrero.','Cartucho',199.00,'SuperMarioOdyssey.webp','T4291E'),(13,6,1,'Kirby and the Forgotten Land ','Desplázate flotando en una nueva aventura como Kirby, la poderosa bola rosada. Explora escenarios en 3D mientras descubres un misterioso mundo, rescatas a los cautivos Waddle Dees y derrotas a la temible jauría. ¡Esperamos que anheles emprender tu aventura!.','Cartucho',199.00,'KirbyForgottenLand.webp','T4292E'),(14,6,1,'The Legend of Zelda: Breath of the Wild','Link despierta tras un profundo sueño de 100 años en un misterioso templo en el reino de Hyrule; junto a él, deberemos descubrir su pasado mientras escuchamos una voz que nos incita a enfrentarnos a un malvado ser que provocó el llamado cataclismo: Ganon.','Cartucho',199.00,'TheLegendOfZelda.webp','T4293E'),(15,5,1,'Super Smash Bros. Ultimate','Es la nueva entrega para Nintendo Switch de la popular saga de Nintendo centrada en el género de lucha, en la que personajes como Super Mario, Zelda, Samus de Metroid, Donkey Kong o Pikachu de Pokémon por citar algunos, combaten en los más variados escenarios extraídos del legado digital de la empresa japonesa, así como de compañías invitadas de la talla de Capcom, Bandai Namco, SEGA o Konami.','Cartucho',199.00,'SuperSmashBrosUltimate.webp','T4294E'),(16,5,2,'God of War','Tras años de venganza contra los Dioses del Olimpo, Kratos ahora vive como un hombre en el reino de los dioses nórdicos y los monstruos. Es en este mundo duro e implacable donde debe luchar para sobrevivir... y enseñarle a su hijo a hacer lo mismo.','Disco',79.00,'GodOfWar.webp','T4295E'),(17,1,2,'The Last of Us Remastered','Veinte años después de que una pandemia cambiara radicalmente la civilización tal como la conocemos, los humanos infectados corren salvajemente por todos lados y los sobrevivientes se matan entre sí para obtener alimentos, armas, y lo que puedan encontrar. Joel, un violento sobreviviente, es contratado para rescatar a Ellie, una niña de 14 años, de una opresiva zona militar en cuarentena.','Disco',79.00,'TheLastOfUsRemastered.webp','T4296E'),(18,6,2,'Red Dead Redemption II','América, 1899. Arthur Morgan y la banda de Van der Linde son forajidos a la fuga. Con agentes federales y los mejores cazarrecompensas de la nación pisándoles los talones, la pandilla debe robar, robar y abrirse camino a través del accidentado corazón de Estados Unidos para sobrevivir. A medida que las divisiones internas cada vez más profundas amenazan con dividir a la pandilla, Arthur debe elegir entre sus propios ideales y la lealtad a la pandilla que lo crió.','Disco',119.00,'RedDeadRedemption2.webp','T4297E'),(19,5,3,'Halo 5','Ocho meses después de la destrucción del mundo escudo Requiem, la UNSC desplegó el Equipo de Fuego Osiris, un equipo de élite de los Spartan-IV de los cuales consta de Agentes de la ONI y el líder de escuadrón Jameson Locke, Ingeniero del Ejército del acebo Tanaka, Armada Traductor y Piloto Olympia Vale, y el veterano ODST patrullero Edward Buck en el planeta Kamchatka controlado por el nuevo Covenant para extraer a la doctora Catherine Elizabeth Halsey, que desea despertar de nuevo al Consejo de Seguridad.','Disco',159.00,'Halo5.webp','T4298E'),(20,5,3,'Gears of War 5','Con la guerra total descendiendo, Kait Diaz se separa para descubrir su conexión con el enemigo y descubre el verdadero peligro para Sera: ella misma. Las nuevas características de la campaña te permiten llevar tu personaje y las máscaras de armas a nuevas partidas y disfrutar de dificultades y modificadores adicionales.','Disco',159.00,'Gears5.webp','T4299E'),(21,1,2,'Back 4 Blood','Back 4 Blood es un emocionante juego de disparos en primera persona cooperativo, de los creadores de la aclamada franquicia de Left 4 Dead. Te encuentras en el centro de una guerra contra los infectados. Estos seres, que alguna vez fueron humanos, son huéspedes de un parásito letal que los convierte en criaturas determinadas a devorar lo que queda de la civilización. Con la inminente extinción de la humanidad, depende de ti y tus amigos llevar la lucha al enemigo, erradicar a los infectados y recuperar el mundo.','Disco',299.00,'Back4Blood.webp','T4300E');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(13) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `idSubCategoria` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`idSubCategoria`),
  KEY `idCategoria_idx` (`idCategoria`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
INSERT INTO `subcategoria` VALUES (1,1,'Thriller'),(2,1,'Deporte'),(3,1,'Musical'),(4,1,'Suspenso'),(5,1,'Acción'),(6,1,'Aventura'),(7,2,'PlayStation 4'),(8,2,'PlayStation 5'),(9,2,'Nintendo Switch'),(10,2,'Xbox Series X'),(11,3,'Mando Xbox'),(12,3,'Dualshock'),(13,3,'JoyCon'),(14,3,'DualSense');
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `idRol` int NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idRol_idx` (`idRol`),
  CONSTRAINT `idRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'AlbertApc','albert.apc@mail.com','T3fDHBUcRBBxypS9omIPeyoZ6WNuuwmV');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idDistribuidor` int NOT NULL,
  `monto` decimal(5,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `direccionEntrega` varchar(200) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idCliente_idx` (`idCliente`),
  KEY `idDistribuidor_idx` (`idDistribuidor`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `idDistribuidor` FOREIGN KEY (`idDistribuidor`) REFERENCES `distribuidor` (`idDistribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10 20:47:29
