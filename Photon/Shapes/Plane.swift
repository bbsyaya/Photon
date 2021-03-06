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
import simd

public final class Plane: GeometricObject {
  public let point: Point3D
  public let normal: Normal

  public var material: Material

  public init(point: Point3D, normal: Normal, material: Material) {
    self.point = point
    self.normal = normalize(normal)
    self.material = material
  }


  // MARK: - Public Functions

  @inline(__always) public func contains(point foreignPoint: Point3D) -> Bool {
    return dot(Vector3D(point: foreignPoint - point), normal) == 0
  }

  // MARK: - Geometric Object

  public func intersection(with ray: Ray) -> Intersection {
    let denominator = dot(ray.direction, normal)

    if abs(denominator) > 1e-6 {
      let vectorInsidePlane = Vector3D(point: point - ray.origin)
      let t = dot(vectorInsidePlane, normal) / denominator
      let hit = (t >= 0)

      return Intersection(t: t, isHit: hit, normal: normal, material: material, intersectionPoint: ray.origin + (ray.direction * t))
    }

    return Intersection.none
  }
}
