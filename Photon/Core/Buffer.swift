// Buffer.swift
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

public typealias PixelCoordinate = (x: Int, y: Int)

public struct Buffer {
  let width: UInt
  let height: UInt
  var pixelData: [PixelData]

  /// Initializes a new Buffer with an array of pixel data containing black pixels.
  init(width: UInt, height: UInt) {
    self.width = width
    self.height = height

    let pixel = PixelData(r: 0, g: 0, b: 0)
    self.pixelData = [PixelData](repeating: pixel, count: Int(width * height))
  }

  subscript(coordinate: PixelCoordinate) -> PixelData {
    get {
      return pixelData[0]
    }
    set {
      pixelData[0] = newValue
    }
  }
}
