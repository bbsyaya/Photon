// BasicIntegrator.swift
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

public final class BasicIntegrator: Integrator {

  // Having the integrator know about the scene directly is not great. It should
  // only need to know about where to find objects to check intersections with.
  // A cleaner approach may be to have a `GeometricObjectProvider` which returns
  // an array of objects, so that this class can be more generalized.
  public weak var scene: Scene?

  // MARK: - Integrator

  public func trace(ray: Ray, depth: Int = 0) -> PixelData {
    guard let scene = self.scene else { preconditionFailure("The integrator should always have a scene") }

    for object in scene.objects {
      let intersection = object.intersection(with: ray)
      if intersection.isHit {
        return PixelData.init(r: 255, g: 0, b: 0)
      }
    }

    return PixelData.init(r: 0, g: 0, b: 0)
  }

}
