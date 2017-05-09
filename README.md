# Photon

A very early work-in-progress ray tracer, implemented in Swift.

[![TravisCI Build Status](https://travis-ci.org/samsymons/Photon.svg?branch=master)](https://travis-ci.org/samsymons/Photon)

---

### Building

Any of Photon's targets can be built in `Photon.xcworkspace`. This includes the playground, core framework, unit test suite, and command-line tool.

Swift package manager support may be included for easy building of `Photon.framework`.

### Roadmap

Features implemented and planned for Photon:

#### Shapes

* [x] Planes
* [x] Spheres
* [ ] Rectangles
* [ ] Triangles

#### Materials

* [ ] Diffuse material
* [ ] Reflections
* [ ] Transparency

#### Miscellaneous

* [ ] OBJ file parsing
* [ ] SIMD support
* [ ] A command-line tool for rendering OBJ files
* [ ] SwiftPM support