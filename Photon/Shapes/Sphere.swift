// Sphere.swift
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

public final class Sphere: GeometricObject {
  public let center: Point3D
  public let radius: Float

  private var radiusSquared: Float {
    return radius * radius
  }

  public init(center: Point3D, radius: Float) {
    self.center = center
    self.radius = radius
  }


  // MARK: - Geometric Object

  public func intersection(with ray: Ray) -> Intersection {
    let vector = Vector3D(point: center - ray.origin)
    let tca = vector.dot(ray.direction)
    let d2 = vector.dot(vector) - tca * tca

    if d2 > radiusSquared {
      return Intersection.none
    }

    let thc = sqrt(radiusSquared - d2)
    var t0 = tca - thc
    var t1 = tca + thc

    if t0 > t1 {
      swap(&t0, &t1)
    }

    if t0 < 0 {
      t0 = t1
      if t0 < 0 {
        return Intersection.none
      }
    }

    let t = t0
    let hitPoint = ray.origin + (ray.direction * t)

    return Intersection(t: t, isHit: true, normal: Normal(point: hitPoint - center).normalized(), intersectionPoint: hitPoint)
  }
}
