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
```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```
```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```
```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.
```
```
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.
```
```
As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```

### Functional representation of the stories

Objects | Messages
------------- | -------------
Person |
Bike | working?
DockingStation | release_bike
DockingStation | dock(bike)
DockingStation | :bike

### Diagram of objects and methods
```
CLASS              METHOD            OUTPUT  
Bike           --> working?      --> true/false
DockingStation --> release_bike  --> Bike.new
DockingStation --> release_bike  --> - guard condition to return nothing when no bikes available
DockingStation --> dock(bike)    --> bike stored in an instance variable
DockingStation --> dock(bike)    --> - guard condition to prevent docking when default capacity has been reached
DockingStation --> :bike         --> bike read from the instance variable
```
