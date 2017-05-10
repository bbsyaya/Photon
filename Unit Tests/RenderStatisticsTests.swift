// RenderStatisticsTests.swift
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
import XCTest
import Photon

import Foundation

final class RenderStatisticsTests: XCTestCase {

  func testInitialization() {
    let statistics = RenderStatistics()

    XCTAssertNil(statistics.startTime)
    XCTAssertNil(statistics.endTime)
  }

  func testStartRendering() {
    let statistics = RenderStatistics()
    statistics.startRendering()

    XCTAssertNotNil(statistics.startTime)
    XCTAssertNil(statistics.endTime)
  }

  func testCompleteRendering() {
    let statistics = RenderStatistics()
    statistics.startRendering()
    statistics.completeRendering()

    XCTAssertNotNil(statistics.startTime)
    XCTAssertNotNil(statistics.endTime)
  }

  func testIncrementingThePixelsRenderedTotal() {
    let statistics = RenderStatistics()
    statistics.startRendering()
    statistics.incrementPixelCounter()
    statistics.incrementPixelCounter()
    statistics.incrementPixelCounter()
    statistics.completeRendering()

    XCTAssertEqual(statistics.pixelsCalculated, 3)
  }

}
