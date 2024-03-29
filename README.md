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
```
As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.
```
```
As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
```
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```

### Functional representation of the stories

Objects | Messages
------------- | -------------
Person |
Bike | working?
Bike | report_broken
DockingStation | release_bike
DockingStation | dock(bike)
DockingStation | :bikes
DockingStation | :capacity
Van | release_broken_bike_to(garage)
Van | dock_broken(bike)from(docking_station)
Van | release_working_bike_to(docking_station)
Van | dock_working(bike)from(garage)
Van | :bikes
Van | :capacity
Garage | release_bike
Garage | dock(bike)
Garage | :bikes
Garage | :capacity

### Diagram of objects and methods
```
CLASS              METHOD                                                  OUTPUT  
Bike           --> working?                                            --> true/false
Bike           --> report_broken                                       --> working? => false
DockingStation --> release_bike                                        --> bike popped from an array
DockingStation --> release_bike                                        --> - guard condition to return nothing when no bikes available
DockingStation --> release_bike                                        --> - guard condition to not to return broken bikes
DockingStation --> dock(bike)                                          --> bike stored in an array
DockingStation --> dock(bike)                                          --> - guard condition to prevent docking when default capacity has been reached
DockingStation --> :bikes                                              --> bike read from the array
DockingStation --> :capacity                                           --> capacity read from the instance variable with the same name
Van            --> release_broken_bike_to(garage)                      --> bike popped from an array
Van            --> release_broken_bike_to(garage)                      --> - guard condition to return nothing when no bikes available
Van            --> release_broken_bike_to(garage)                      --> - guard condition to return nothing when default capacity has been reached
Van            --> dock_broken(bike)from(docking_station)              --> bike stored in an array
Van            --> dock_broken(bike)from(docking_station)              --> - guard condition to prevent docking when default capacity has been reached
Van            --> dock_broken(bike)from(docking_station)              --> - guard condition to prevent docking when bike is working
Van            --> release_working_bike_to(docking_station)            --> bike popped from an array
Van            --> release_working_bike_to(docking_station)            --> - guard condition to return nothing when no bikes available
Van            --> release_working_bike_to(docking_station)            --> - guard condition to return nothing when default capacity has been reached
Van            --> dock_working(bike)from(garage)                      --> bike stored in an array
Van            --> dock_working(bike)from(garage)                      --> - guard condition to prevent docking when default capacity has been reached
Van            --> dock_working(bike)from(garage)                      --> - guard condition to prevent docking when bike is working
Van            --> :bikes                                              --> bike read from the array
Van            --> :capacity                                           --> capacity read from the instance variable with the same name
Garage         --> release_bike                                        --> bike popped from an array
Garage         --> release_bike                                        --> - guard condition to return nothing when no bikes available
Garage         --> release_bike                                        --> - guard condition to not to return broken bikes
Garage         --> dock(bike)                                          --> bike stored in an array
Garage         --> dock(bike)                                          --> - guard condition to prevent docking when default capacity has been reached
Garage         --> :bikes                                              --> bike read from the array
Garage         --> :capacity                                           --> capacity read from the instance
```

### Project Challenges

-Isolating Unit tests with doubles:

Eventually the system can do pretty much everything the client wants. However, Unit Tests are not isolated. If there was a bug in the `Bike` class, all tests for `DockingStation` class will fail. There could be hours hours spent trying to find a problem thinking that it resides within `docking_station.rb`, when in fact it's located in `bike.rb`. To isolate UnitTests was necessary to use doubles.

-Mocking behaviour on doubles with method stubs:

For the doubles to respond to certain methods with predefined values it is necessary to mock behaviour with method stubs.
