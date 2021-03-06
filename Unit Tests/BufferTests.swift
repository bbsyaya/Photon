// BufferTests.swift
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
import Cocoa
import XCTest
import Photon

final class BufferTests: XCTestCase {

  func testInitialization() {
    let buffer = Buffer(width: 100, height: 100)
    XCTAssertEqual(buffer.pixelData.count, 100 * 100)
  }

  func testSubscripts() {
    let buffer = Buffer(width: 100, height: 100)
    let pixel = PixelData(r: 255, g: 255, b: 255)
    buffer[(50, 50)] = pixel

    XCTAssertEqual(buffer[(50, 50)], pixel)
  }

  func testIteration() {
    var iterationCount = 0
    let buffer = Buffer(width: 10, height: 10)

    for _ in buffer {
      iterationCount += 1
    }

    XCTAssertEqual(iterationCount, buffer.size)
  }
  
}
