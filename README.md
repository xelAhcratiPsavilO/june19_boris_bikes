# Boris Bikes

### Objectives

- TDD a project.
- Show fluency programming in Ruby.
- Debug anything.

### User stories
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```
```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

### Functional representation of the stories

Objects | Messages
------------- | -------------
Person |
Bike | working?
DockingStation | release_bike

### Diagram of objects and methods
```
CLASS              METHOD            OUTPUT  
Bike           --> working?      --> true/false
DockingStation --> release_bike  --> Bike.new
```
