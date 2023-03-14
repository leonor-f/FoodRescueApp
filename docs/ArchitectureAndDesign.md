## Architecture and Design

### Logical architecture
![LogicalView](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC09T3/blob/main/images/LogicalView.png)

- `Food Rescue UI`: visualize application pages
- `Food Rescue Database`: database with the supermarkets info (name and address) and respective food products
- `Food Rescue Business Logic`: handles all information provided by the users of the app
- `Google Maps API and Google Directions API`: locate supermarkets near the user through the user's coordinates
- `Google Sheets API`: register application database


### Physical architecture
Our app's physical architecture diagram features three nodes, representing the devices involved in the project and the connections between them.

The user's **Mobile Device** node, where the app will be installed, includes the Food Rescue app developed in Dart and the device's internal storage,
essential to store the user's personal info (favorite supermarkets and bucket list).

The **Food Rescue Server** node runs the backend of the Food Rescue app, being the interface between the other 2 nodes. It manages the information
stored in the databases so it can be updated whenever necessary (adding / removing favorite supermarkets from the Stores Database, adding / removing
items from the Products Database, and updating new products depending on their availability in the supermarket in the Products Database). It also stores
the user's current location (information received from the Google Server node), necessary to execute the user's requests.

The **Google Server** node locates the user spatially through the Google Maps and Google Directions APIs, and stores the data necessary for the services
in the Google Sheets API.

![DeploymentView](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC09T3/blob/main/images/DeploymentView.png)


### Vertical prototype
**Feature 1 - Bottom search bar**
In the first feature we decided to implement was the search bar at the bottom, with all the different pages we will need in our app. We created different pages in separate files to organize our code. Each item on the search bar opens a different page.

https://user-images.githubusercontent.com/93678161/225099617-208a8255-317e-4ff9-a39f-c35b965f1481.mp4


**Feature 2 - Sheets x Flutter**
Since we needed to keep the data of the different stores and their products in a database, we decided to implement the Google Sheets API and also use those same databases. By doing this, we were able to obtain a prototype of how the user's favorite stores page will look. Whenever a store in the database is marked as a favorite, it will appear on the application's page, as you can see below.

https://user-images.githubusercontent.com/93678161/225102720-96e76b01-2724-47a6-a373-bc4a801d041a.mp4

![fef](https://user-images.githubusercontent.com/93678161/225103043-5910a1b7-94e8-4555-9fad-f6c5bceccf89.png)


**Feature 3 - Maps x Flutter**
Since we also needed to use a map on one of the main pages of the project, we decided to implement that API already, as can be seen below.

![Screenshot_2](https://user-images.githubusercontent.com/93678161/225103816-7987fc53-eb12-4f3e-a0c3-97ce18b920fe.png)