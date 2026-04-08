SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cidade` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uf` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'João da Silva', 'São Paulo', 'SP');
INSERT INTO `clientes` VALUES (2, 'Maria Oliveira', 'Rio de Janeiro', 'RJ');
INSERT INTO `clientes` VALUES (3, 'Pedro Almeida', 'Belo Horizonte', 'MG');
INSERT INTO `clientes` VALUES (4, 'Ana Santos', 'Curitiba', 'PR');
INSERT INTO `clientes` VALUES (5, 'Carlos Ferreira', 'Porto Alegre', 'RS');
INSERT INTO `clientes` VALUES (6, 'Fernanda Costa', 'Salvador', 'BA');
INSERT INTO `clientes` VALUES (7, 'Roberto Lima', 'Fortaleza', 'CE');
INSERT INTO `clientes` VALUES (8, 'Juliana Pereira', 'Manaus', 'AM');
INSERT INTO `clientes` VALUES (9, 'Marcos Rodrigues', 'Recife', 'PE');
INSERT INTO `clientes` VALUES (10, 'Patrícia Souza', 'Goiânia', 'GO');
INSERT INTO `clientes` VALUES (11, 'Lucas Martins', 'Florianópolis', 'SC');
INSERT INTO `clientes` VALUES (12, 'Camila Barbosa', 'Vitória', 'ES');
INSERT INTO `clientes` VALUES (13, 'Diego Carvalho', 'Campo Grande', 'MS');
INSERT INTO `clientes` VALUES (14, 'Larissa Melo', 'Cuiabá', 'MT');
INSERT INTO `clientes` VALUES (15, 'Thiago Nascimento', 'Belém', 'PA');
INSERT INTO `clientes` VALUES (16, 'Aline Gomes', 'Teresina', 'PI');
INSERT INTO `clientes` VALUES (17, 'Gustavo Araújo', 'São Luís', 'MA');
INSERT INTO `clientes` VALUES (18, 'Renata Pinto', 'Natal', 'RN');
INSERT INTO `clientes` VALUES (19, 'Felipe Teixeira', 'João Pessoa', 'PB');
INSERT INTO `clientes` VALUES (20, 'Vanessa Monteiro', 'Maceió', 'AL');
INSERT INTO `clientes` VALUES (21, 'André Freitas', 'Aracaju', 'SE');
INSERT INTO `clientes` VALUES (22, 'Letícia Corrêa', 'Macapá', 'AP');
INSERT INTO `clientes` VALUES (43, 'ASDASDASD', 'DASDASD', 'AS');
INSERT INTO `clientes` VALUES (44, 'ASDASD', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (45, 'ASDAS', 'ASDAS', 'AS');
INSERT INTO `clientes` VALUES (46, 'ASDAASD', 'ASDAS', 'AS');
INSERT INTO `clientes` VALUES (47, 'ASDAASD', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (48, 'ASDASDAS', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (49, 'ASDASD', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (50, 'ASDASD', 'ASDAS', 'AS');
INSERT INTO `clientes` VALUES (51, 'ASDASD', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (52, 'JOÃO DA SILVA', 'SÃO PAULO', 'SP');
INSERT INTO `clientes` VALUES (53, 'ASDAS', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (54, 'ASDAASD', 'ASDAS', 'AS');
INSERT INTO `clientes` VALUES (55, 'ASDASDASD', 'DASDASD', 'AS');
INSERT INTO `clientes` VALUES (56, 'ASDASDASD', 'DASDASD', 'AS');
INSERT INTO `clientes` VALUES (57, 'ASDASDASD', 'DASDASD', 'AS');
INSERT INTO `clientes` VALUES (58, 'ASDASD', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (59, 'ASDASD', 'ASDASD', 'AS');
INSERT INTO `clientes` VALUES (60, 'ASDASD', 'ASDASD', 'AS');

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` date NOT NULL,
  `codigo_cliente` int(11) NOT NULL,
  `valor_total` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`codigo`) USING BTREE,
  INDEX `idx_pedidos_cliente`(`codigo_cliente`) USING BTREE,
  INDEX `idx_pedidos_emissao`(`data_emissao`) USING BTREE,
  CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pedidos
-- ----------------------------
INSERT INTO `pedidos` VALUES (16, '2026-03-29', 48, 0.00);
INSERT INTO `pedidos` VALUES (17, '2026-03-29', 49, 50187.50);
INSERT INTO `pedidos` VALUES (18, '2026-03-29', 50, 562.50);
INSERT INTO `pedidos` VALUES (19, '2026-03-29', 51, 71.25);
INSERT INTO `pedidos` VALUES (20, '2026-03-30', 52, 12.50);
INSERT INTO `pedidos` VALUES (21, '2026-03-30', 53, 10.00);
INSERT INTO `pedidos` VALUES (22, '2026-03-30', 54, 40.00);
INSERT INTO `pedidos` VALUES (23, '2026-03-30', 55, 93000.00);
INSERT INTO `pedidos` VALUES (24, '2026-03-30', 56, 97500.00);
INSERT INTO `pedidos` VALUES (25, '2026-03-30', 57, 93000.00);
INSERT INTO `pedidos` VALUES (26, '2026-03-30', 58, 10.00);
INSERT INTO `pedidos` VALUES (27, '2026-03-31', 59, 93010.00);
INSERT INTO `pedidos` VALUES (28, '2026-03-31', 60, 50.00);

-- ----------------------------
-- Table structure for pedidos_produtos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_produtos`;
CREATE TABLE `pedidos_produtos`  (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_produto` int(11) NOT NULL,
  `quantidade` decimal(10, 3) NOT NULL,
  `vr_unitario` decimal(10, 2) NOT NULL,
  `vr_total` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`codigo_pedido`, `codigo_produto`) USING BTREE,
  INDEX `idx_pp_produto`(`codigo_produto`) USING BTREE,
  CONSTRAINT `fk_pp_pedido` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pp_produto` FOREIGN KEY (`codigo_produto`) REFERENCES `produtos` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pedidos_produtos
-- ----------------------------
INSERT INTO `pedidos_produtos` VALUES (17, 61, 50000.000, 1.00, 50000.00);
INSERT INTO `pedidos_produtos` VALUES (17, 62, 75.000, 2.50, 187.50);
INSERT INTO `pedidos_produtos` VALUES (18, 63, 100.000, 5.50, 550.00);
INSERT INTO `pedidos_produtos` VALUES (18, 64, 5.000, 2.50, 12.50);
INSERT INTO `pedidos_produtos` VALUES (19, 65, 10.000, 5.00, 50.00);
INSERT INTO `pedidos_produtos` VALUES (19, 66, 7.000, 2.50, 17.50);
INSERT INTO `pedidos_produtos` VALUES (19, 67, 5.000, 0.75, 3.75);
INSERT INTO `pedidos_produtos` VALUES (20, 68, 5.000, 2.50, 12.50);
INSERT INTO `pedidos_produtos` VALUES (21, 69, 10.000, 1.00, 10.00);
INSERT INTO `pedidos_produtos` VALUES (22, 70, 20.000, 2.00, 40.00);
INSERT INTO `pedidos_produtos` VALUES (23, 71, 10.000, 50.00, 500.00);
INSERT INTO `pedidos_produtos` VALUES (23, 72, 500.000, 185.00, 92500.00);
INSERT INTO `pedidos_produtos` VALUES (24, 73, 100.000, 50.00, 5000.00);
INSERT INTO `pedidos_produtos` VALUES (24, 74, 500.000, 185.00, 92500.00);
INSERT INTO `pedidos_produtos` VALUES (25, 75, 10.000, 50.00, 500.00);
INSERT INTO `pedidos_produtos` VALUES (25, 76, 500.000, 185.00, 92500.00);
INSERT INTO `pedidos_produtos` VALUES (26, 77, 10.000, 1.00, 10.00);
INSERT INTO `pedidos_produtos` VALUES (27, 78, 10.000, 50.00, 500.00);
INSERT INTO `pedidos_produtos` VALUES (27, 79, 500.000, 185.00, 92500.00);
INSERT INTO `pedidos_produtos` VALUES (27, 80, 10.000, 1.00, 10.00);
INSERT INTO `pedidos_produtos` VALUES (28, 83, 50.000, 1.00, 50.00);

-- ----------------------------
-- Table structure for produtos
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos`  (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `preco_venda` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES (1, 'Notebook Dell Inspiron 15', 3299.90);
INSERT INTO `produtos` VALUES (2, 'Monitor LG 24\" Full HD', 899.90);
INSERT INTO `produtos` VALUES (3, 'Teclado Mecânico Redragon', 259.90);
INSERT INTO `produtos` VALUES (4, 'Mouse Sem Fio Logitech MX', 149.90);
INSERT INTO `produtos` VALUES (5, 'Headset Gamer HyperX Cloud', 349.90);
INSERT INTO `produtos` VALUES (6, 'SSD Kingston A400 480GB', 279.90);
INSERT INTO `produtos` VALUES (7, 'Memória RAM 8GB DDR4 2666MHz', 199.90);
INSERT INTO `produtos` VALUES (8, 'Placa de Vídeo GTX 1650 4GB', 1499.90);
INSERT INTO `produtos` VALUES (9, 'Fonte Corsair 600W 80 Plus', 329.90);
INSERT INTO `produtos` VALUES (10, 'Gabinete Gamer RGB Mid Tower', 399.90);
INSERT INTO `produtos` VALUES (11, 'Webcam Logitech C920 HD Pro', 499.90);
INSERT INTO `produtos` VALUES (12, 'Impressora HP LaserJet M130', 1199.90);
INSERT INTO `produtos` VALUES (13, 'Hub USB-C 7 em 1 Multilaser', 189.90);
INSERT INTO `produtos` VALUES (14, 'Cabo HDMI 2.0 3 Metros', 39.90);
INSERT INTO `produtos` VALUES (15, 'Nobreak SMS Station 1200VA', 899.90);
INSERT INTO `produtos` VALUES (16, 'Roteador TP-Link AX1500 Wi-Fi 6', 399.90);
INSERT INTO `produtos` VALUES (17, 'Pen Drive 64GB Kingston USB 3.2', 59.90);
INSERT INTO `produtos` VALUES (18, 'HD Externo Seagate 1TB USB 3.0', 399.90);
INSERT INTO `produtos` VALUES (19, 'Smartphone Samsung Galaxy A54', 1699.90);
INSERT INTO `produtos` VALUES (20, 'Tablet Lenovo Tab M10 Plus', 1299.90);
INSERT INTO `produtos` VALUES (21, 'Suporte Articulado para Monitor', 189.90);
INSERT INTO `produtos` VALUES (22, 'Mousepad Gamer Speed XL', 79.90);
INSERT INTO `produtos` VALUES (38, 'A', 1.50);
INSERT INTO `produtos` VALUES (39, 'B', 1.00);
INSERT INTO `produtos` VALUES (40, 'ASDASDASD', 1.00);
INSERT INTO `produtos` VALUES (41, 'B', 2.00);
INSERT INTO `produtos` VALUES (42, 'SDFSDF', 1.00);
INSERT INTO `produtos` VALUES (43, 'B', 2.00);
INSERT INTO `produtos` VALUES (44, 'SDFSDFSDF', 1.00);
INSERT INTO `produtos` VALUES (45, 'DSFGSDG', 2.00);
INSERT INTO `produtos` VALUES (46, 'AAAAAAAA', 1.50);
INSERT INTO `produtos` VALUES (47, 'B', 9.75);
INSERT INTO `produtos` VALUES (48, 'ZXC', 10.00);
INSERT INTO `produtos` VALUES (49, '45435', 5.00);
INSERT INTO `produtos` VALUES (50, 'ASDASD', 50.00);
INSERT INTO `produtos` VALUES (51, 'DFDSDF', 185.00);
INSERT INTO `produtos` VALUES (52, 'ASDASD', 5.00);
INSERT INTO `produtos` VALUES (53, 'SDFSDFSD', 165.00);
INSERT INTO `produtos` VALUES (54, 'ASDASD', 20.00);
INSERT INTO `produtos` VALUES (55, 'ASDASD2', 20.00);
INSERT INTO `produtos` VALUES (56, 'A', 5.00);
INSERT INTO `produtos` VALUES (57, 'B', 3.50);
INSERT INTO `produtos` VALUES (58, 'A', 5.00);
INSERT INTO `produtos` VALUES (59, 'B1', 20.00);
INSERT INTO `produtos` VALUES (60, 'C', 5.50);
INSERT INTO `produtos` VALUES (61, 'A', 1.00);
INSERT INTO `produtos` VALUES (62, 'B', 2.50);
INSERT INTO `produtos` VALUES (63, 'ASDASD', 5.50);
INSERT INTO `produtos` VALUES (64, 'V', 2.50);
INSERT INTO `produtos` VALUES (65, 'ASDASD', 5.00);
INSERT INTO `produtos` VALUES (66, 'A', 2.50);
INSERT INTO `produtos` VALUES (67, 'B', 0.75);
INSERT INTO `produtos` VALUES (68, 'DSFDSFSD', 2.50);
INSERT INTO `produtos` VALUES (69, 'ASDASD', 1.00);
INSERT INTO `produtos` VALUES (70, 'ASDASD', 2.00);
INSERT INTO `produtos` VALUES (71, 'ASDASD', 50.00);
INSERT INTO `produtos` VALUES (72, 'DFDSDF', 185.00);
INSERT INTO `produtos` VALUES (73, 'ASDASD1', 50.00);
INSERT INTO `produtos` VALUES (74, 'DFDSDF', 185.00);
INSERT INTO `produtos` VALUES (75, 'ASDASD', 50.00);
INSERT INTO `produtos` VALUES (76, 'DFDSDF', 185.00);
INSERT INTO `produtos` VALUES (77, 'ASDASD', 1.00);
INSERT INTO `produtos` VALUES (78, 'ASDASD', 50.00);
INSERT INTO `produtos` VALUES (79, 'DFDSDF', 185.00);
INSERT INTO `produtos` VALUES (80, 'ASDASD', 1.00);
INSERT INTO `produtos` VALUES (82, 'X9', 1.00);
INSERT INTO `produtos` VALUES (83, 'XXXX', 1.00);

SET FOREIGN_KEY_CHECKS = 1;
