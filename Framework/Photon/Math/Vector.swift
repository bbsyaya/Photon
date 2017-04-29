// Vector.swift
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

public typealias Scalar = Float

// MARK: - Vector2D

public struct Vector2D {
  var x: Float
  var y: Float

  public init(_ x: Scalar, _ y: Scalar) {
    self.x = x
    self.y = y
  }
}

extension Vector2D: Equatable {
  public static func ==(lhs: Vector2D, rhs: Vector2D) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }

  public static func +(lhs: Vector2D, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs.x + rhs.x, lhs.y + rhs.y)
  }

  public static func -(lhs: Vector2D, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs.x - rhs.x, lhs.y - rhs.y)
  }

  public static func *(lhs: Vector2D, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs.x * rhs.x, lhs.y * rhs.y)
  }

  public static func /(lhs: Vector2D, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs.x / rhs.x, lhs.y / rhs.y)
  }
}


// MARK: - Vector3D

public struct Vector3D {
  var x: Float
  var y: Float
  var z: Float

  public init(_ x: Scalar, _ y: Scalar, _ z: Scalar) {
    self.x = x
    self.y = y
    self.z = z
  }
}

extension Vector3D: Equatable {
  public static func ==(lhs: Vector3D, rhs: Vector3D) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
  }

  public static func +(lhs: Vector3D, rhs: Vector3D) -> Vector3D {
    return Vector3D(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  public static func -(lhs: Vector3D, rhs: Vector3D) -> Vector3D {
    return Vector3D(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  public static func *(lhs: Vector3D, rhs: Vector3D) -> Vector3D {
    return Vector3D(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z)
  }

  public static func /(lhs: Vector3D, rhs: Vector3D) -> Vector3D {
    return Vector3D(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z)
  }
}
