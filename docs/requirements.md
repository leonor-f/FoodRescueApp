## Requirements

### Domain model

The Domain Model contains 5 main classes. The **User class** is characterized by the user's **name**,
list of favorite supermarkets (**favMarkets**) and products (**favItems**), and current **location**,
identified in the Location class by its unique coordinates (**latitude** and **longitude**). Each
supermarket chain (**MarketChain** class) is identified by its **name** and, in turn, has several
supermarkets in different locations (objects of the Market class, which have a **name** and a unique
**location** that distinguishes them). A supermarket has several **products**, characterized by their
unique id (**productID**), **name**, **quantity**, **price**, **expiration date** and a boolean attribute
that registers whether the product is in stock or not (**available**). Each product is categorized into 7
different types: **Vegetables**; **Fruits**; **Fats**; **Dairy**; Meat, fish and eggs (**MeatFishEggs**
class); **Carbs**; **Drinks**, that belong to the **Category** class.

 <p align="center" justify="center">
  <img src="https://github.com/FEUP-LEIC-ES-2022-23/2LEIC09T3/blob/main/images/DomainModel.png"/>
</p>