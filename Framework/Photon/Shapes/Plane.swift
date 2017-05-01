// Plane.swift
// Copyright (c) 2017 Sam Symons
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public final class Plane: GeometricObject {
  let point: Point3D
  let normal: Normal

  init(point: Point3D, normal: Normal) {
    self.point = point
    self.normal = normal.normalized()
  }


  // MARK: - Public Functions

  @inline(__always) public func contains(point foreignPoint: Point3D) -> Bool {
    return Vector3D(point: foreignPoint - point).dot(normal) == 0
  }

  // MARK: - Geometric Object

  public func intersected(by ray: Ray) -> Bool {
    let denominator = ray.direction.dot(Vector3D(normal: normal))

    if denominator > 1e-6 {
      let vectorInsidePlane = Vector3D(point: point - ray.origin)
      let t = vectorInsidePlane.dot(normal) / denominator

      return (t >= 0)
    }

    return false
  }
}

/*
 Vector3f newPoint = point - ray.origin;
 Vector3f direction = normal / Dot(ray.direction, Vector3f(normal));
 float t = Dot(newPoint, direction);

 if (t > kEpsilon) {
 time = t;
 record.normal = normal;
 record.intersectionPoint = ray.origin + (ray.direction * t);

 return true;
 }

 return false;
 */
