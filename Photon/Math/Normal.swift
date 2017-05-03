// Normal.swift
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

public struct Normal {
  public static let zero = Normal(0, 0, 0)
  public static let x = Normal(1, 0, 0)
  public static let y = Normal(0, 1, 0)
  public static let z = Normal(0, 0, 1)

  var x: Float
  var y: Float
  var z: Float

  public init(_ x: Float, _ y: Float, _ z: Float) {
    self.x = x
    self.y = y
    self.z = z
  }

  public init(point: Point3D) {
    self.init(point.x, point.y, point.z)
  }

  public var lengthSquared: Float {
    return x * x + y * y + z * z
  }

  public var length: Float {
    return sqrt(lengthSquared)
  }

  public func normalized() -> Normal {
    return self / sqrt(lengthSquared)
  }
}

extension Normal: Equatable {

  public static func == (lhs: Normal, rhs: Normal) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
  }

  public static func + (lhs: Normal, rhs: Normal) -> Normal {
    return Normal(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  public static func - (lhs: Normal, rhs: Normal) -> Normal {
    return Normal(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  public static func * (lhs: Normal, rhs: Normal) -> Normal {
    return Normal(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z)
  }

  public static func / (lhs: Normal, rhs: Normal) -> Normal {
    return Normal(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z)
  }

  // MARK: Float Arithmetic

  public static func + (lhs: Normal, rhs: Float) -> Normal {
    return Normal(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs)
  }

  public static func - (lhs: Normal, rhs: Float) -> Normal {
    return Normal(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs)
  }

  public static func * (lhs: Normal, rhs: Float) -> Normal {
    return Normal(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
  }

  public static func / (lhs: Normal, rhs: Float) -> Normal {
    return Normal(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
  }
}

extension Normal: CustomStringConvertible {
  public var description: String {
    return "Normal (x: \(x), y: \(y), z: \(z))"
  }
}
