// Sampler.swift
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

/// Defines the interface for sampler classes.
///
/// Samplers are used to choose which points within each pixel are sampled and
/// used to calculate the average color within that pixel, allowing for anti-aliasing.
public protocol Sampler {

  /// The number of samples to take at each point.
  ///
  /// The larger this value is, the more likely you are to get a good average
  /// color at that point. Note that this value directly affects the image
  /// generation time, as a new ray is cast for every point in the sample bundle.
  var sampleBundleSize: Int { get set }

  /// Generates a bundle of sample points around a given point.
  ///
  /// This is used by Photon to generate a set of points at each pixel, in order
  /// to generate a fair estimate of the average color at that pixel.
  func generateSampleBundle(at: Point2D) -> [Point2D]
}
