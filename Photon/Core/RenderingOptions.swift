// RenderingOptions.swift
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

public struct RenderingOptions {
  var width: Int
  var height: Int

  var camera: Camera
  var callbackQueue: DispatchQueue

  var sampleAdditionalPoints = true
  var sampler = JitteredSampler(bundleSize: 25)

  public init(width: Int, height: Int, camera: Camera? = nil, callbackQueue: DispatchQueue? = nil) {
    self.width = width
    self.height = height

    self.camera = camera ?? OrthographicCamera()
    self.callbackQueue = callbackQueue ?? DispatchQueue.main
  }
}
