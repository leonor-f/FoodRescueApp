.headers on
.mode column
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS MarketChain;
DROP TABLE IF EXISTS Market;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;

CREATE TABLE User (
      name varchar(30)
);
                    
CREATE TABLE Location (
    latitude int not null,
    longitude int not null,
    primary key (latitude, longitude)
);
                  
CREATE TABLE MarketChain (
    market_chain_name varchar(30) not null,
    primary key (market_chain_name)
);

CREATE TABLE Market (
    market_chain_name varchar(30) REFERENCES MarketChain(market_chain_name),
    market_name varchar(30) not null,
    market_latitude int not null,
    market_longitude int not null,
    is_favorite bool default 0,
    store_image varchar(30),
    primary key (market_name),
    foreign key (market_latitude, market_longitude) REFERENCES Location(latitude, longitude),
    check(is_favorite=1 or is_favorite=0)
);
CREATE TABLE Category (
    category_name varchar(30) not null,
    primary key (category_name)
);

CREATE TABLE Product (
    market_name varchar(30) REFERENCES Market(market_name),
    product_name varchar(30) not null,
    old_price float not null,
    new_price float default 0.0,
    quantity int default 0,
    expiration_date date not null,
    is_available bool default 1,
    to_buy bool default 0,
    category varchar(30) REFERENCES Category(category_name),
    product_image varchar(30),
    primary key (product_name, market_name, expiration_date),
    check(quantity>=0),
    check(old_price>0.0),
    check(new_price>=0.0),
    check(is_available=1 or is_available=0),
    check(to_buy=1 or to_buy=0)
);

INSERT INTO MarketChain (market_chain_name)
VALUES 
    ('Continente'),
    ('Brio'),
    ('Apolónia'),
    ('Lidl'),
    ('Pingo Doce'),
    ('Intermaché'),
    ('Froiz'),
    ('Auchan'),
    ('Minipreço');

INSERT INTO Location (latitude, longitude) 
VALUES 
    (41.16706666929213, -8.6130576256218), 
    (41.17765922549262, -8.591238283089654), 
    (41.09745930305267, -8.598163535845265), 
    (41.14913987612964, -8.605735893017838), 
    (38.727735936051616, -9.141492007259659), 
    (37.092480396332675, -8.03978318341418), 
    (37.12636504291049, -8.453118279599462), 
    (41.17114451888732, -8.610280581614736), 
    (41.18108366494271, -8.581939913821598), 
    (41.16002474243559, -8.594235884175752), 
    (41.20000251129936, -8.609290898392503), 
    (41.18663086838835, -8.608954583426073), 
    (41.19380033728715, -8.610925030042857), 
    (41.19651326557036, -8.612382861184058), 
    (41.183148238219545, -8.629637907609014), 
(41.25531644065388, -8.66469946558512),
(41.126778192167706, -8.590779543254856),
(41.118435646201014, -8.55303886484232),
(41.12053224104389, -8.50867500833185),
(41.10581503043138, -8.586301530642764),
(41.18326011622457, -8.606315303777395),
(41.164184470420636, -8.621357751071791),
(41.17707549155018, -8.564355540686455),
(41.14414275193201, -8.639137493913102),
(41.25146220748657, -8.622220149968232),
(41.22976718216859, -8.621899290340497),
(41.20204592761519, -8.645758105268039),
(41.217309916496696, -8.556418127184886),
(41.181857430419214, -8.682082181873257);


INSERT INTO Market (market_chain_name, market_name, market_latitude, market_longitude, is_favorite, store_image)
VALUES
    ('Continente', 'Continente Bom Dia Vale Formoso', 41.16706666929213, -8.6130576256218, 1, 'assets/images/continente.png'),
    ('Continente', 'Continente Bom Dia Asprela', 41.17765922549262, -8.591238283089654, 0, 'assets/images/continente.png'),
    ('Continente', 'Continente Modelo Gaia (Rechousa)', 41.09745930305267, -8.598163535845265, 0, 'assets/images/continente.png'),
    ('Continente', 'Continente Bom Dia Via Catarina Shopping', 41.14913987612964, -8.605735893017838, 0, 'assets/images/continente.png'),
    ('Brio', 'Brio Supermercado Biológico Picoas', 38.727735936051616, -9.141492007259659, 0, 'assets/images/brio.png'),
    ('Apolónia', 'Apolónia Almancil', 37.092480396332675, -8.03978318341418, 0, 'assets/images/apolonia.jpg'),
    ('Apolónia', 'Apolónia Lagoa', 37.12636504291049, -8.453118279599462, 0, 'assets/images/apolonia.jpg'),
    ('Lidl', 'Lidl Joaquim Bastos', 41.17114451888732, -8.610280581614736, 1, 'assets/images/lidl.png'),
    ('Lidl', 'Lidl da Areosa', 41.18108366494271, -8.581939913821598, 0, 'assets/images/lidl.png'),
    ('Lidl', 'Lidl Porto Fernão Magalhães', 41.16002474243559, -8.594235884175752, 0, 'assets/images/lidl.png'),
    ('Lidl', 'Lidl - São Mamede Infesta', 41.20000251129936, -8.609290898392503, 0, 'assets/images/lidl.png'),
    ('Pingo Doce', 'Pingo Doce Circunvalação Asprela', 41.18663086838835, -8.608954583426073, 0, 'assets/images/pingodoce.png'),
    ('Pingo Doce', 'Pingo Doce São Mamede de Infesta - Godinho Faria', 41.19380033728715, -8.610925030042857, 0, 'assets/images/pingodoce.png'),
    ('Pingo Doce', 'Pingo Doce São Mamede de Infesta - Sá e Melo', 41.19651326557036, -8.612382861184058, 0, 'assets/images/pingodoce.png'),
    ('Pingo Doce', 'Pingo Doce São Mamede de Infesta - Travessa da Concórdia', 41.183148238219545, -8.629637907609014, 0, 'assets/images/pingodoce.png'),
    ('Pingo Doce', 'Pingo Doce Matosinhos - Afonso Henriques', 41.181857430419214, -8.682082181873257, 0, 'assets/images/pingodoce.png'),
    
('Intermaché', 'Intermarché Vila Nova Da Telha', 41.25531644065388, -8.66469946558512, 1, 'assets/images/intermache.png'),
('Intermaché', 'Intermarché Oliveira do Douro', 41.126778192167706, -8.590779543254856, 0, 'assets/images/intermache.png'),
('Intermaché', 'Intermarché Avintes', 41.118435646201014, -8.55303886484232, 0, 'assets/images/intermache.png'),
('Intermaché', 'Intermarché Jovim', 41.12053224104389, -8.50867500833185, 0, 'assets/images/intermache.png'),
('Froiz', 'Supermercado Froiz - Monte da Virgem Imaculada', 41.10581503043138, -8.586301530642764, 0, 'assets/images/froiz.png'),
('Froiz', 'Froiz Asprela', 41.18326011622457, -8.606315303777395, 0, 'assets/images/froiz.png'),
('Froiz', 'Froiz - Rua da Constituição', 41.164184470420636, -8.621357751071791, 0, 'assets/images/froiz.png'),
('Auchan', 'Auchan Gondomar', 41.17707549155018, -8.564355540686455, 0, 'assets/images/auchan.png'),
('Auchan', 'Auchan Vila Nova de Gaia', 41.14414275193201, -8.639137493913102, 0, 'assets/images/auchan.png'),
('Auchan', 'Auchan Maia', 41.25146220748657, -8.622220149968232, 0, 'assets/images/auchan.png'),
('Minipreço', 'Minipreço Maia', 41.22976718216859, -8.621899290340497, 0, 'assets/images/minipreco.png'),
('Minipreço', 'Minipreço - Rua Cândido dos Reis', 41.20204592761519, -8.645758105268039, 0, 'assets/images/minipreco.png'),
('Minipreço', 'Minipreço - Rua Lourenço Marques', 41.217309916496696, -8.556418127184886, 1, 'assets/images/minipreco.png');

INSERT INTO Category (category_name)
VALUES 
        ('Laticínios e Ovos'),
       ('Frutas e Legumes'),
       ('Peixaria e Talho'),
       ('Refeições Fáceis'),
       ('Padaria e Pastelaria'),
       ('Bebidas');

INSERT INTO Product (market_name, product_name, old_price, new_price, quantity, expiration_date, to_buy, category)
VALUES 
('Continente Bom Dia Vale Formoso', 'Ovos Médios 6 unidades', 1.90, 0.70, 1, '2023-05-17', 1, 'Laticínios e Ovos'),
('Continente Bom Dia Vale Formoso', 'Salada Ibérica 200gr', 1.39, 0.79, 1, '2023-05-17', 0, 'Frutas e Legumes'),
('Continente Bom Dia Vale Formoso', 'Sopa de Agrião 600gr', 2.10, 1.10, 1, '2023-05-19', 0, 'Frutas e Legumes'),
('Continente Bom Dia Via Catarina Shopping', 'Sopa de Espinafres 600gr', 2.10, 1.10, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Continente Bom Dia Via Catarina Shopping', 'Peito de Frango 1.2kg', 8.15, 6.40, 1, '2023-05-16', 0, 'Peixaria e Talho'),
('Continente Bom Dia Via Catarina Shopping', 'Nuggets de Soja 400gr', 4.99, 2.29, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Continente Bom Dia Via Catarina Shopping', 'Salada Ibérica 200gr', 1.39, 0.79, 1, '2023-05-16', 0, 'Frutas e Legumes'),
('Continente Bom Dia Via Catarina Shopping', 'Bacalhau à brás 300gr', 2.49, 1.10, 1, '2023-05-18', 1, 'Refeições Fáceis'),
('Continente Bom Dia Asprela', 'Sopa de Espinafres 600gr', 2.10, 1.10, 1, '2023-05-20', 0, 'Frutas e Legumes'),
('Continente Bom Dia Asprela', 'Ovos Médios 6 unidades', 1.90, 0.70, 1, '2023-05-20', 0, 'Laticínios e Ovos'),
('Continente Bom Dia Asprela', 'Arroz de Pato 250gr', 2.99, 1.99, 1, '2023-05-20', 0, 'Refeições Fáceis'),
('Continente Bom Dia Asprela', 'Ovos Médios 6 unidades', 1.90, 0.70, 1, '2023-05-17', 0, 'Laticínios e Ovos'),
('Continente Bom Dia Asprela', 'Iogurtes s/ lactose banana 4 unidades', 2.19, 1.39, 1, '2023-05-20', 0, 'Laticínios e Ovos'),
('Continente Modelo Gaia (Rechousa)', 'Sopa de Agrião 600gr', 2.10, 1.10, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Continente Modelo Gaia (Rechousa)', 'Pão de forma 650gr', 1.39, 0.79, 1, '2023-05-19', 0, 'Padaria e Pastelaria'),
('Continente Modelo Gaia (Rechousa)', 'Ovos Grandes 6 unidades', 2.10, 0.89, 1, '2023-05-20', 0, 'Laticínios e Ovos'),
('Continente Modelo Gaia (Rechousa)', 'Queijo limiano 200gr', 2.39, 1.99, 1, '2023-05-20', 1, 'Laticínios e Ovos'),
('Continente Modelo Gaia (Rechousa)', 'Peito de Frango 1.2kg', 8.15, 6.40, 1, '2023-05-20', 0, 'Peixaria e Talho'),
('Brio Supermercado Biológico Picoas', 'Nuggets de Soja 350gr', 4.59, 2.19, 1, '2023-05-16', 0, 'Refeições Fáceis'),
('Brio Supermercado Biológico Picoas', 'Salada Ibérica 200gr', 1.39, 0.79, 1, '2023-05-21', 0, 'Frutas e Legumes'),
('Brio Supermercado Biológico Picoas', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-21', 0, 'Laticínios e Ovos'),
('Brio Supermercado Biológico Picoas', 'Queijo limiano 200gr', 2.39, 1.99, 1, '2023-05-18', 0, 'Laticínios e Ovos'),
('Brio Supermercado Biológico Picoas', 'Sopa de Espinafres 600gr', 2.10, 1.10, 1, '2023-05-21', 0, 'Frutas e Legumes'),
('Brio Supermercado Biológico Picoas', 'Salada Ibérica 200gr', 1.39, 0.79, 1, '2023-05-20', 1, 'Frutas e Legumes'),
('Brio Supermercado Biológico Picoas', 'Leite Fresco Gordo 1L', 0.99, 0.59, 1, '2023-05-18', 1, 'Laticínios e Ovos'),
('Brio Supermercado Biológico Picoas', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-17', 0, 'Laticínios e Ovos'),
('Apolónia Almancil', 'Queijo limiano 200gr', 2.39, 1.99, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Apolónia Almancil', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Apolónia Almancil', 'Ovos Grandes 6 unidades', 2.30, 0.99, 1, '2023-05-19', 1, 'Laticínios e Ovos'),
('Apolónia Lagoa', 'Sopa de Agrião 600gr', 2.10, 1.10, 1, '2023-05-21', 0, 'Frutas e Legumes'),
('Apolónia Lagoa', 'Gelatina Pronta Morango 400gr', 0.95, 0.55, 1, '2023-05-16', 0, 'Refeições Fáceis'),
('Apolónia Lagoa', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-21', 0, 'Laticínios e Ovos');

INSERT INTO Product (market_name, product_name, old_price, new_price, quantity, expiration_date, to_buy, category)
VALUES 
('Lidl Joaquim Bastos', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Lidl Joaquim Bastos', 'Peito de Frango 1.0kg', 7.49, 6.99, 1, '2023-05-19', 0, 'Peixaria e Talho'),
('Lidl Joaquim Bastos', 'Pão de forma 650gr', 1.39, 0.79, 1, '2023-05-18', 0, 'Padaria e Pastelaria'),
('Lidl Joaquim Bastos', 'Ovos Grandes 6 unidades', 2.20, 0.79, 1, '2023-05-21', 0, 'Laticínios e Ovos'),
('Lidl Joaquim Bastos', 'Arroz de Pato 250gr', 2.89, 1.89, 1, '2023-05-20', 0, 'Refeições Fáceis'),
('Lidl Joaquim Bastos', 'Sopa de Espinafres 600gr', 2.10, 1.10, 1, '2023-05-19', 0, 'Frutas e Legumes'),
    ('Lidl Joaquim Bastos', 'Bacalhau à brás 300gr', 2.49, 1.10, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Lidl da Areosa', 'Queijo Flamengo 200gr', 1.99, 0.99, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Lidl da Areosa', 'Salada Ibérica 200gr', 1.39, 0.79, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Lidl da Areosa', 'Queijo Flamengo 200gr', 1.99, 0.99, 1, '2023-05-17', 0, 'Laticínios e Ovos'),
('Lidl da Areosa', 'Peito de Peru 1.1kg', 7.69, 5.59, 1, '2023-05-19', 0, 'Peixaria e Talho'),
('Lidl Porto Fernão Magalhães', 'Queijo limiano 200gr', 2.99, 1.89, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Lidl Porto Fernão Magalhães', 'Pão de forma 650gr', 1.39, 0.79, 1, '2023-05-18', 0, 'Padaria e Pastelaria'),
('Lidl Porto Fernão Magalhães', 'Sopa de Espinafres 600gr', 2.10, 1.10, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Lidl Porto Fernão Magalhães', 'Iogurtes s/ lactose morango 4 unidades', 2.19, 1.39, 1, '2023-05-18', 0, 'Laticínios e Ovos'),
('Lidl - São Mamede Infesta', 'Ovos Grandes 6 unidades', 2.20, 0.79, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Lidl - São Mamede Infesta', 'Gelatina Pronta Morango 400gr', 0.95, 0.55, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Lidl - São Mamede Infesta', 'Cenouras 1kg', 1.29, 0.99, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Lidl - São Mamede Infesta', 'Peito de Frango 1.0kg', 7.49, 6.99, 1, '2023-05-16', 0, 'Peixaria e Talho'),
    ('Lidl - São Mamede Infesta', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-18', 0, 'Laticínios e Ovos'),
('Pingo Doce Circunvalação Asprela', 'Peito de Frango 1.1kg', 7.69, 5.59, 1, '2023-05-21', 0, 'Peixaria e Talho'),
('Pingo Doce Circunvalação Asprela', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-16', 0, 'Laticínios e Ovos'),
('Pingo Doce Circunvalação Asprela', 'Sumo Natural Laranja e Maçã 75cl', 1.89, 0.99, 1, '2023-05-21', 0, 'Bebidas'),
('Pingo Doce Circunvalação Asprela', 'Peito de Peru 800gr', 6.49, 5.59, 1, '2023-05-20', 0, 'Peixaria e Talho'),
('Pingo Doce Circunvalação Asprela', 'Sumo Natural Laranja e Maçã 75cl', 1.89, 0.99, 1, '2023-05-16', 0, 'Bebidas'),
('Pingo Doce Circunvalação Asprela', 'Sopa de Espinafres 600gr', 2.10, 1.10, 1, '2023-05-21', 0, 'Frutas e Legumes'),
('Pingo Doce Circunvalação Asprela', 'Queijo limiano 400gr', 5.19, 2.99, 1, '2023-05-21', 0, 'Laticínios e Ovos'),
('Pingo Doce São Mamede de Infesta - Godinho Faria', 'Sumo Natural Laranja e Maçã 75cl', 1.89, 0.99, 1, '2023-05-17', 0, 'Bebidas'),
('Pingo Doce São Mamede de Infesta - Godinho Faria', 'Gelatina Pronta Morango 400gr', 0.95, 0.55, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Pingo Doce São Mamede de Infesta - Godinho Faria', 'Salada Ibérica 200gr', 1.59, 0.79, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Pingo Doce São Mamede de Infesta - Sá e Melo', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-18', 0, 'Laticínios e Ovos'),
    ('Pingo Doce São Mamede de Infesta - Sá e Melo', 'Pão de forma 650gr', 1.39, 0.79, 1, '2023-05-19', 0, 'Padaria e Pastelaria'),
('Pingo Doce São Mamede de Infesta - Travessa da Concórdia', 'Peito de Frango 1.1kg', 7.69, 5.59, 1, '2023-05-17', 0, 'Peixaria e Talho'),
('Pingo Doce São Mamede de Infesta - Travessa da Concórdia', 'Leite Fresco Gordo 1L', 0.99, 0.59, 1, '2023-05-17', 0, 'Laticínios e Ovos'),
('Pingo Doce São Mamede de Infesta - Travessa da Concórdia', 'Pizza Pepperoni 410gr', 2.49, 1.95, 1, '2023-05-17', 0, 'Refeições Fáceis');

INSERT INTO Product (market_name, product_name, old_price, new_price, quantity, expiration_date, to_buy, category)
VALUES 

('Pingo Doce São Mamede de Infesta - Travessa da Concórdia', 'Arroz de Pato 250gr', 2.99, 1.89, 1, '2023-05-20', 0, 'Refeições Fáceis'),
('Pingo Doce São Mamede de Infesta - Travessa da Concórdia', 'Sumo Natural Laranja e Maçã 75cl', 1.89, 0.99, 1, '2023-05-16', 0, 'Bebidas'),
('Pingo Doce Matosinhos - Afonso Henriques', 'Queijo Flamengo 250gr', 2.99, 1.89, 1, '2023-05-21', 0, 'Laticínios e Ovos'),
('Pingo Doce Matosinhos - Afonso Henriques', 'Peito de Peru 800gr', 6.49, 5.59, 1, '2023-05-21', 0, 'Peixaria e Talho'),
('Pingo Doce Matosinhos - Afonso Henriques', 'Pizza Pepperoni 410gr', 2.49, 1.95, 1, '2023-05-17', 0, 'Refeições Fáceis'),
('Intermarché Vila Nova Da Telha', 'Sopa de Espinafres 500gr', 1.99, 0.98, 1, '2023-05-16', 0, 'Frutas e Legumes'),
('Intermarché Vila Nova Da Telha', 'Bacalhau à brás 300gr', 2.49, 1.1, 1, '2023-05-16', 0, 'Refeições Fáceis'),
('Intermarché Vila Nova Da Telha', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-20', 0, 'Laticínios e Ovos');

INSERT INTO Product (market_name, product_name, old_price, new_price, quantity, expiration_date, to_buy, category)
VALUES 
    ('Intermarché Vila Nova Da Telha', 'Peito de Frango 1.1kg', 7.69, 5.59, 1, '2023-05-21', 0, 'Peixaria e Talho'),
('Intermarché Oliveira do Douro', 'Nuggets de Soja 350gr', 4.59, 2.19, 1, '2023-05-20', 0, 'Refeições Fáceis'),
('Intermarché Oliveira do Douro', 'Pizza Quatro Queijos 410gr', 2.49, 1.95, 1, '2023-05-21', 0, 'Refeições Fáceis'),
('Intermarché Avintes', 'Ovos Grandes 6 unidades', 2.2, 0.99, 1, '2023-05-20', 0, 'Laticínios e Ovos'),
('Intermarché Avintes', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-16', 0, 'Laticínios e Ovos'),
('Intermarché Avintes', 'Queijo Flamengo 250gr', 2.99, 1.89, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Intermarché Avintes', 'Salada Ibérica 200gr', 1.49, 0.79, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Intermarché Avintes', 'Pão de forma 650gr', 1.39, 0.79, 1, '2023-05-17', 0, 'Padaria e Pastelaria');

INSERT INTO Product (market_name, product_name, old_price, new_price, quantity, expiration_date, to_buy, category)
VALUES 
('Intermarché Jovim', 'Gelatina Pronta Morango 400gr', 0.95, 0.55, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Intermarché Jovim', 'Peito de Frango 800gr', 6.49, 5.59, 1, '2023-05-19', 0, 'Peixaria e Talho'),
('Intermarché Jovim', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-16', 0, 'Laticínios e Ovos'),
('Intermarché Jovim', 'Pizza Quatro Queijos 410gr', 2.49, 1.95, 1, '2023-05-16', 0, 'Refeições Fáceis'),
('Supermercado Froiz - Monte da Virgem Imaculada', 'Pizza Queijo e Fiambre 410gr', 2.49, 1.95, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Supermercado Froiz - Monte da Virgem Imaculada', 'Sopa de Espinafres 500gr', 1.99, 0.98, 1, '2023-05-16', 0, 'Frutas e Legumes'),
    ('Supermercado Froiz - Monte da Virgem Imaculada', 'Gelatina Pronta Morango 400gr', 0.95, 0.55, 1, '2023-05-21', 0, 'Refeições Fáceis'),
('Supermercado Froiz - Monte da Virgem Imaculada', 'Peito de Peru 800gr', 6.49, 5.59, 1, '2023-05-16', 0, 'Peixaria e Talho'),
('Froiz - Rua da Constituição', 'Peito de Frango 900gr', 6.99, 5.99, 1, '2023-05-21', 0, 'Peixaria e Talho'),
('Froiz - Rua da Constituição', 'Queijo Flamengo 250gr', 2.99, 1.89, 1, '2023-05-20', 0, 'Laticínios e Ovos'),
('Froiz - Rua da Constituição', 'Arroz de Pato 250gr', 2.89, 1.89, 1, '2023-05-19', 0, 'Refeições Fáceis'),
('Froiz - Rua da Constituição', 'Ovos Grandes 6 unidades', 2.2, 0.89, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Froiz - Rua da Constituição', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Froiz - Rua da Constituição', 'Sopa de Espinafres 500gr', 1.89, 1.1, 1, '2023-05-21', 0, 'Frutas e Legumes'),
('Froiz - Rua da Constituição', 'Cenouras 1kg', 1.29, 0.99, 1, '2023-05-19', 0, 'Frutas e Legumes'),
('Auchan Gondomar', 'Nuggets de Soja 350gr', 4.59, 2.19, 1, '2023-05-19', 0, 'Refeições Fáceis');

INSERT INTO Product (market_name, product_name, old_price, new_price, quantity, expiration_date, to_buy, category)
VALUES 
('Auchan Gondomar', 'Bacalhau à brás 300gr', 2.49, 1.1, 1, '2023-05-16', 0, 'Refeições Fáceis'),
('Auchan Gondomar', 'Pão de forma 650gr', 1.39, 0.79, 1, '2023-05-22', 0, 'Padaria e Pastelaria'),
('Auchan Gondomar', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-19', 0, 'Laticínios e Ovos'),
('Auchan Vila Nova de Gaia', 'Salada Ibérica 200gr', 1.29, 0.89, 1, '2023-05-19', 0, 'Frutas e Legumes'),
    ('Auchan Vila Nova de Gaia', 'Pizza Quatro Queijos 410gr', 2.99, 2.19, 1, '2023-05-18', 0, 'Refeições Fáceis'), 
('Auchan Vila Nova de Gaia', 'Leite Fresco Meio Gordo 1L', 0.99, 0.59, 1, '2023-05-21', 0, 'Laticínios e Ovos'),
('Auchan Vila Nova de Gaia', 'Cenouras 1kg', 1.29, 0.99, 1, '2023-05-20', 0, 'Frutas e Legumes'),
('Auchan Vila Nova de Gaia', 'Peito de Frango 700gr', 5.99, 4.65, 1, '2023-05-16', 0, 'Peixaria e Talho'),
('Auchan Maia', 'Pizza Quatro Queijos 410gr', 2.49, 1.95, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Auchan Maia', 'Peito de Peru 800gr', 6.49, 5.59, 1, '2023-05-22', 0, 'Peixaria e Talho'),
('Auchan Maia', 'Sopa de Agrião 500gr', 1.89, 1.19, 1, '2023-05-22', 0, 'Frutas e Legumes'),
('Auchan Maia', 'Ovos Grandes 6 unidades', 2.20, 0.99, 1, '2023-05-22', 0, 'Laticínios e Ovos'),
('Auchan Maia', 'Leite Fresco Magro 1L', 0.99, 0.59, 1, '2023-05-22', 0, 'Laticínios e Ovos'),
('Minipreço Maia', 'Pizza Quatro Queijos 410gr', 2.49, 1.95, 1, '2023-05-18', 0, 'Refeições Fáceis'),
('Minipreço Maia', 'Sopa de Espinafres 500gr', 1.99, 0.99, 1, '2023-05-22', 0, 'Frutas e Legumes'),
('Minipreço Maia', 'Leite Fresco Meio Gordo 1L', 0.99, 0.59, 1, '2023-05-17', 0, 'Laticínios e Ovos'),
('Minipreço Maia', 'Peito de Frango 700gr', 5.99, 4.65, 1, '2023-05-20', 0, 'Peixaria e Talho'),
('Minipreço Maia', 'Pão de forma 650gr', 1.99, 0.99, 1, '2023-05-22', 0, 'Padaria e Pastelaria'),
    ('Minipreço - Rua Cândido dos Reis', 'Queijo Flamengo 250gr', 2.99, 1.89, 2, '2023-05-20', 0, 'Laticínios e Ovos'),
('Minipreço - Rua Cândido dos Reis', 'Salada Ibérica 200gr', 1.29, 0.89, 1, '2023-05-21', 0, 'Frutas e Legumes'),
('Minipreço - Rua Cândido dos Reis', 'Nuggets de Soja 250gr', 4.29, 1.99, 1, '2023-05-19', 0, 'Refeições Fáceis'),
('Minipreço - Rua Cândido dos Reis', 'Leite Fresco Meio Gordo 1L', 0.99, 0.59, 1, '2023-05-16', 0, 'Laticínios e Ovos'),

('Minipreço - Rua Cândido dos Reis', 'Iogurtes côco 4 unidades', 1.89, 0.79, 1, '2023-05-16', 0, 'Laticínios e Ovos'),
('Minipreço - Rua Cândido dos Reis', 'Sopa de Agrião 500gr', 1.89, 1.19, 1, '2023-05-16', 0, 'Frutas e Legumes'),
('Minipreço - Rua Lourenço Marques', 'Bacalhau à brás 300gr', 2.49, 1.1, 1, '2023-05-19', 0, 'Refeições Fáceis'),
('Minipreço - Rua Lourenço Marques', 'Pão de forma 650gr', 1.99, 0.99, 1, '2023-05-16', 0, 'Padaria e Pastelaria'),
('Minipreço - Rua Lourenço Marques', 'Sopa de Espinafres 500gr', 1.99, 0.99, 1, '2023-05-18', 0, 'Frutas e Legumes'),
('Minipreço - Rua Lourenço Marques', 'Ovos Grandes 6 unidades', 2.15, 0.99, 1, '2023-05-17', 0, 'Laticínios e Ovos');
