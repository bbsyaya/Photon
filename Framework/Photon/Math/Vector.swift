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
  public static let zero = Vector2D(0, 0)
  public static let x = Vector2D(1, 0)
  public static let y = Vector2D(0, 1)

  var x: Float
  var y: Float

  public init(_ x: Scalar, _ y: Scalar) {
    self.x = x
    self.y = y
  }
}

extension Vector2D: Equatable {

  // MARK: 2D Vector Arithmetic

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

  // MARK: Scalar Arithmetic

  public static func +(lhs: Vector2D, rhs: Scalar) -> Vector2D {
    return Vector2D(lhs.x + rhs, lhs.y + rhs)
  }

  public static func -(lhs: Vector2D, rhs: Scalar) -> Vector2D {
    return Vector2D(lhs.x - rhs, lhs.y - rhs)
  }

  public static func *(lhs: Vector2D, rhs: Scalar) -> Vector2D {
    return Vector2D(lhs.x * rhs, lhs.y * rhs)
  }

  public static func /(lhs: Vector2D, rhs: Scalar) -> Vector2D {
    return Vector2D(lhs.x / rhs, lhs.y / rhs)
  }
}


// MARK: - Vector3D

public struct Vector3D {
  public static let zero = Vector3D(0, 0, 0)
  public static let x = Vector3D(1, 0, 0)
  public static let y = Vector3D(0, 1, 0)
  public static let z = Vector3D(0, 0, 1)

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

  // MARK: Scalar Arithmetic

  public static func +(lhs: Vector3D, rhs: Scalar) -> Vector3D {
    return Vector3D(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs)
  }

  public static func -(lhs: Vector3D, rhs: Scalar) -> Vector3D {
    return Vector3D(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs)
  }

  public static func *(lhs: Vector3D, rhs: Scalar) -> Vector3D {
    return Vector3D(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
  }

  public static func /(lhs: Vector3D, rhs: Scalar) -> Vector3D {
    return Vector3D(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
  }
}
