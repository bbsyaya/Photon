// JitteredSamplerTests.swift
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

final class JitteredSamplerTests: XCTestCase {

  func testInitialization() {
    let sampler = JitteredSampler(bundleSize: 10)
    XCTAssertEqual(sampler.sampleBundleSize, 10)
  }

  func testSampleSizeGeneration() {
    let sampler = JitteredSampler(bundleSize: 20)
    let samples = sampler.generateSampleBundle(at: Point2D.zero)

    XCTAssertEqual(samples.count, 20)
  }

  func testSamplePointOffsets() {
    let sampler = JitteredSampler(bundleSize: 30)
    let samples = sampler.generateSampleBundle(at: Point2D(3, 10))

    for sample in samples {
      XCTAssert(sample.x >= 3 && sample.x <= 4)
      XCTAssert(sample.y >= 10 && sample.y <= 11)
    }
  }

}
