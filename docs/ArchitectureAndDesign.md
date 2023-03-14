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
describe which feature you have implemented, and how, together with a snapshot of the user interface.
