## Architecture and Design

### Logical architecture
![LogicalView](images/LogicalView.png)

- `Food Rescue UI`: visualize application pages
- `Food Rescue Database`: database with the supermarkets info (name and address) and respective food products
- `Food Rescue Business Logic`: handles all information provided by the users of the app
- `Google Maps API and Google Directions API`: locate supermarkets near the user through the user's coordinates

### Physical architecture
Our app's physical architecture diagram features three nodes, representing the devices involved in the project and the connections between them.

The user's **Mobile Device** node, where the app will be installed, includes the Food Rescue app developed in Dart and the device's internal storage,
essential to store the user's personal info (favorite supermarkets and bucket list).

The **Food Rescue Server** node runs the backend of the Food Rescue app, being the interface between the other 2 nodes. It manages the information
stored in the databases so it can be updated whenever necessary (adding / removing favorite supermarkets from the Stores Database, adding / removing
items from the Products Database, and updating new products depending on their availability in the supermarket in the Products Database). It also stores the user's current location (information received from the Google Server node), necessary to execute the user's requests.

The **Google Server** node locates the user spatially through the Google Maps and Google Directions APIs, and stores the data necessary for the services in the Google Sheets API.

![DeploymentView](images/DeploymentView.png)


### Vertical prototype

#### Features
##### Feature 1 - Bottom search bar
In the first feature, we decided to implement a search bar at the bottom, with all the different pages of our app.
We created different pages in separate files to organize our code. Each item on the search bar opens a different page.

##### Feature 2 - SQL x Flutter
Since we needed to access the data of the different supermarkets and respective products in a database, we decided
to create a database in SQL to store this information. By doing this, we were able to obtain a prototype of
how the user's favorite supermarkets page will look like. Whenever a supermarket is marked as favorite, it appears
on the app's "Favoritos" page, as shown below.

##### Feature 3 - Maps x Flutter
Since we also needed to use a map in one of the main pages of the project, so that the user can visualize the
supermarkets nearby, we decided to already implement the Google Maps API, as shown below on the "Lojas" page.

![ezgif com-video-to-gif](https://user-images.githubusercontent.com/93678161/226060412-1b9d09eb-84fb-49c1-8da8-b98fd5425242.gif)  |  ![f3](https://user-images.githubusercontent.com/93678161/225103816-7987fc53-eb12-4f3e-a0c3-97ce18b920fe.png)
