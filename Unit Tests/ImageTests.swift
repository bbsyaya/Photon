// ImageTests.swift
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

final class ImageTests: XCTestCase {

  func testEmptyImageGeneration() {
    let emptyImageData: [PixelData] = []
    let image = Image.image(from: emptyImageData, width: 0, height: 0)

    XCTAssertNil(image)
  }

  func testBasicImageGeneration() {
    let imageData: [PixelData] = [PixelData(r: 0, g: 0, b: 0)]
    let image = Image.image(from: imageData, width: 1, height: 1)

    XCTAssertNotNil(image)
  }

  func testImageSizing() {
    let pixel = PixelData(r: 0, g: 255, b: 0)
    let imageData = [PixelData](repeating: pixel, count: 100)
    let image = Image.image(from: imageData, width: 20, height: 5)

    XCTAssertNotNil(image)
    XCTAssertEqual(image?.size.width, 20)
    XCTAssertEqual(image?.size.height, 5)
  }

}
