# Photon

A _very early_ work-in-progress ray tracer, implemented in Swift.

[![TravisCI Build Status](https://travis-ci.org/samsymons/Photon.svg?branch=master)](https://travis-ci.org/samsymons/Photon)

---

### Building

Any of Photon's targets can be built in `Photon.xcworkspace`. This includes the playground, core framework, unit test suite, and command-line tool.

Swift package manager support may be included later for easy building of `Photon.framework`.

---

### Roadmap

Features implemented and planned for Photon:

#### Shapes

* [x] Planes
* [x] Spheres
* [ ] Rectangles
* [ ] Cylinders
* [ ] Triangles

#### Materials

* [ ] Diffuse material
* [ ] Reflections
* [ ] Transparency

#### Miscellaneous

* [ ] Proper lighting
* [ ] OBJ file parsing
* [ ] SIMD support
* [ ] A command-line tool for rendering OBJ files
* [ ] SwiftPM support

---

### Resources

* [Scratchapixel](https://www.scratchapixel.com)
* [PBRT](http://www.pbrt.org)
* [Ray Tracing From The Ground Up](http://www.raytracegroundup.com)
* [An Introduction to Ray Tracing](http://www.glassner.com/portfolio/an-introduction-to-ray-tracing/)