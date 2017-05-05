# Shapes

The `Shapes` directory defines interfaces for the geometric objects used by Photon.

### Supported Objects

* [x] Plane
* [x] Sphere
* [ ] Rectangle
* [ ] Cylinder
* [ ] Triangle

### The GeometricObject Protocol

Each geometric object is defined by how it calculates its intersecting points with any given rays. For example, the `Plane` shape represents a single flat sheet in 3D space, with any rays passing through that sheet intersecting it.

While planes can only have one intersection, other objects, such as spheres, have multiple — when a ray enters a sphere it always has to leave it as well. To resolve this, we use the intersection that requires the lowest value of `t` with the ray in question. This results in the intersection point always being the closest point to the camera.
