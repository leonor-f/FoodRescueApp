create table User (
    name varchar(30)
);

create table Location (
    latitude int not null,
    longitude int not null
);

create table Market (
    marketID varchar(3) not null,
    marketChain varchar(3) foreign key references MarketChain(marketChainID) not null,
    name varchar(30) not null,
    latitude int FOREIGN KEY REFERENCES Location(latitude),
    longitude int FOREIGN KEY REFERENCES Location(longitude),
    favorite bool default 0,
    image varchar(30),
    check(favorite=1 or favorite=0)
);

create table MarketChain (
    marketChainID varchar(3) not null,
    name varchar(30) not null
);

create table Product (
    productID varchar(5) not null,
    name varchar(30),
    quantity int default 0,
    price float not null,
    discount float default 0.0,
    expirationDate date not null,
    available bool default 1,
    favorite bool default 0,
    check(quantity>=0),
    check(price>0.0),
    check(discount>0.0),
    check(available=1 or available=0),
    check(favorite=1 or favorite=0)
);

create table Category (
    code enum('Vegetables', 'Fruits', 'Fats', 'Dairy', 'MeatFishEggs', 'Carbs', 'Drinks') not null
);
