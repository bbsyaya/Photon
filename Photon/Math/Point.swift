// Point.swift
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

// MARK: - Point2D

public struct Point2D {
  public static let zero = Point2D(0, 0)

  public var x: Float
  public var y: Float

  public init(_ x: Float, _ y: Float) {
    self.x = x
    self.y = y
  }
}

extension Point2D: Equatable {

  // MARK: 2D Vector Arithmetic

  public static func == (lhs: Point2D, rhs: Point2D) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }

  public static func + (lhs: Point2D, rhs: Point2D) -> Point2D {
    return Point2D(lhs.x + rhs.x, lhs.y + rhs.y)
  }

  public static func - (lhs: Point2D, rhs: Point2D) -> Point2D {
    return Point2D(lhs.x - rhs.x, lhs.y - rhs.y)
  }

  public static func * (lhs: Point2D, rhs: Point2D) -> Point2D {
    return Point2D(lhs.x * rhs.x, lhs.y * rhs.y)
  }

  public static func / (lhs: Point2D, rhs: Point2D) -> Point2D {
    return Point2D(lhs.x / rhs.x, lhs.y / rhs.y)
  }

  // MARK: Float Arithmetic

  public static func + (lhs: Point2D, rhs: Float) -> Point2D {
    return Point2D(lhs.x + rhs, lhs.y + rhs)
  }

  public static func - (lhs: Point2D, rhs: Float) -> Point2D {
    return Point2D(lhs.x - rhs, lhs.y - rhs)
  }

  public static func * (lhs: Point2D, rhs: Float) -> Point2D {
    return Point2D(lhs.x * rhs, lhs.y * rhs)
  }

  public static func / (lhs: Point2D, rhs: Float) -> Point2D {
    return Point2D(lhs.x / rhs, lhs.y / rhs)
  }
}

extension Point2D: CustomStringConvertible {
  public var description: String {
    return "Point (x: \(x), y: \(y))"
  }
}


// MARK: - Point3D

public struct Point3D {
  public static let zero = Point3D(0, 0, 0)

  public var x: Float
  public var y: Float
  public var z: Float

  public init(_ x: Float, _ y: Float, _ z: Float) {
    self.x = x
    self.y = y
    self.z = z
  }
}

extension Point3D: Equatable {

  public static func == (lhs: Point3D, rhs: Point3D) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
  }

  public static func + (lhs: Point3D, rhs: Point3D) -> Point3D {
    return Point3D(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  public static func + (lhs: Point3D, rhs: float3) -> Point3D {
    return Point3D(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  public static func - (lhs: Point3D, rhs: Point3D) -> Point3D {
    return Point3D(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  public static func * (lhs: Point3D, rhs: Point3D) -> Point3D {
    return Point3D(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z)
  }

  public static func / (lhs: Point3D, rhs: Point3D) -> Point3D {
    return Point3D(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z)
  }

  // MARK: Float Arithmetic

  public static func + (lhs: Point3D, rhs: Float) -> Point3D {
    return Point3D(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs)
  }

  public static func - (lhs: Point3D, rhs: Float) -> Point3D {
    return Point3D(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs)
  }

  public static func * (lhs: Point3D, rhs: Float) -> Point3D {
    return Point3D(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
  }

  public static func / (lhs: Point3D, rhs: Float) -> Point3D {
    return Point3D(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
  }
}

extension Point3D: CustomStringConvertible {
  public var description: String {
    return "Point (x: \(x), y: \(y), z: \(z))"
  }
}
