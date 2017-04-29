// Photon.playground
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
import CoreGraphics
import Photon

public class VectorVisualizationView: NSView {
  private let vectors: [Vector2D]

  private let topColor = NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.3, alpha: 1.0)
  private let bottomColor = NSColor(calibratedRed: 0.9, green: 0.9, blue: 1.0, alpha: 1.0)


  // MARK: - Initialization

  public init(vectors: [Vector2D]) {
    self.vectors = vectors

    // Provide a default size of 300 x 300. This can be customized after view
    // creation instead, to provide a larger preview of each vector.
    super.init(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: - Rendering

  override public func draw(_ dirtyRect: NSRect) {
    guard let context = NSGraphicsContext.current()?.cgContext else { return }

    renderGradientBackground(context: context)
  }

  private func renderGradientBackground(context: CGContext) {
    let colors = [topColor.cgColor, bottomColor.cgColor]
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let colorLocations: [CGFloat] = [0.0, 1.0]

    if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations) {
      let startPoint = CGPoint.zero
      let endPoint = CGPoint(x: 0, y: self.bounds.height)
      context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
    }
  }
}
