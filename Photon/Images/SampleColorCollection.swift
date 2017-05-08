// SampleCollection.swift
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

public struct SampleColorCollection {
  public private(set) var r: Float = 0.0
  public private(set) var g: Float = 0.0
  public private(set) var b: Float = 0.0
  public private(set) var samplesCollected: Int = 0


  // MARK: - Public Functions

  public mutating func collect(color: PixelData) {
    r += Float(color.r)
    g += Float(color.g)
    b += Float(color.b)

    samplesCollected += 1
  }

  public func averagePixelValue() -> PixelData {
    let total = Float(samplesCollected)
    return PixelData(r: sanitize(r / total), g: sanitize(g / total), b: sanitize(b / total))
  }


  // MARK: - Private Functions

  @inline(__always) private func sanitize(_ value: Float) -> UInt8 {
    precondition(value <= Float(UInt8.max), "The sanitized value should never exceed the maximum value of UInt8")
    return UInt8(floor(value))
  }
}
