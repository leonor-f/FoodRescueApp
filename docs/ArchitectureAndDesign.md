
## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code (Logical View), using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

It can be beneficial to present the system both in a horizontal or vertical decomposition:
* horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; 
* vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.

Example of _UML package diagram_ showing a _logical view_ of the Eletronic Ticketing System (to be accompanied by a short description of each package):

![Diagrama sem nome drawio (5)](https://user-images.githubusercontent.com/93678161/225161921-9a056fc4-7808-4c7b-a3d0-1dec43d96f8a.png)

### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams (Deployment View) or component diagrams (Implementation View), separate or integrated, showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for uni4all are, for example, frameworks for mobile applications (such as Flutter).

Example of _UML deployment diagram_ showing a _deployment view_ of the Eletronic Ticketing System (please notice that, instead of software components, one should represent their physical/executable manifestations for deployment, called artifacts in UML; the diagram should be accompanied by a short description of each node and artifact):

![Diagrama sem nome drawio (7)](https://user-images.githubusercontent.com/93678161/225161959-30e4649b-10ff-4ac3-85d7-50d5ada8504a.png)


### Vertical prototype

**Feature 1 - Bottom search bar**

The first feature we decided to implement was the search bar at the bottom, with all the different pages we will need in our app. We created different pages in separate files to organize our code. Each item on the search bar opens a different page.

https://user-images.githubusercontent.com/93678161/225099617-208a8255-317e-4ff9-a39f-c35b965f1481.mp4

**Feature 2 - Sheets x Flutter**

Since we needed to keep the data of the different stores and their products in a database, we decided to implement the Google Sheets API and also use those same databases. By doing this, we were able to obtain a prototype of how the user's favorite stores page will look. Whenever a store in the database is marked as a favorite, it will appear on the application's page, as you can see below.


https://user-images.githubusercontent.com/93678161/225102720-96e76b01-2724-47a6-a373-bc4a801d041a.mp4

![fef](https://user-images.githubusercontent.com/93678161/225103043-5910a1b7-94e8-4555-9fad-f6c5bceccf89.png)


**Feature 3 - Maps x Flutter**

Since we also needed to use a map on one of the main pages of the project, we decided to implement that API already, as can be seen below.

![Screenshot_2](https://user-images.githubusercontent.com/93678161/225103816-7987fc53-eb12-4f3e-a0c3-97ce18b920fe.png)

