// RenderStatistics.swift
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

public final class RenderStatistics {
  public private(set) var startTime: DispatchTime?
  public private(set) var endTime: DispatchTime?
  public private(set) var elapsedTime: Double = -1

  private let semaphore = DispatchSemaphore(value: 1)

  private var _pixelsCalculated: Int = 0
  public private(set) var pixelsCalculated: Int {
    get {
      semaphore.wait()
      defer { semaphore.signal() }
      return _pixelsCalculated
    }
    set {
      semaphore.wait()
      defer { semaphore.signal() }
      _pixelsCalculated = newValue
    }
  }

  public init() {}


  // MARK: - Duration Tracking

  public func startRendering() {
    startTime = DispatchTime.now()
  }

  @discardableResult public func completeRendering() -> Double {
    endTime = DispatchTime.now()
    guard let start = startTime, let end = endTime else { preconditionFailure("The statistics tracker should have valid start and end times.") }

    let difference = end.uptimeNanoseconds - start.uptimeNanoseconds
    elapsedTime = Double(difference) / 1_000_000_000

    return elapsedTime
  }


  // MARK: - Statistic Gathering

  @discardableResult public func incrementPixelCounter() -> Int {
    semaphore.wait()
    defer { semaphore.signal() }

    _pixelsCalculated += 1
    return _pixelsCalculated
  }
}
