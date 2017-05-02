// Image.swift
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
import CoreGraphics

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit
  public typealias ImageType = UIImage
#elseif os(OSX)
  import Cocoa
  public typealias ImageType = NSImage
#endif

/// Represents a single pixel color.
///
/// - Note: The alpha channel is largely ignored throughout the framework, and
///         is only included to satisfy CGImage. There should always be maximum
///         alpha; no pixels are transparent.
public struct PixelData {
  let r: UInt8
  let g: UInt8
  let b: UInt8
  let a: UInt8 = 255

  public init(r: UInt8, g: UInt8, b: UInt8) {
    self.r = r
    self.g = g
    self.b = b
  }
}

extension PixelData: Equatable {
  public static func ==(lhs: PixelData, rhs: PixelData) -> Bool {
    return lhs.r == rhs.r && lhs.g == rhs.g && lhs.b == rhs.b && lhs.a == rhs.a
  }
}

/// `Image` provides helpers functions for generating a platform-friendly image
/// from an array of `PixelData` structs.
public struct Image {
  private static let colorSpace = CGColorSpaceCreateDeviceRGB()
  private static let bitmapInfo: CGBitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)

  /// Returns an image from a given array of `PixelData`.
  ///
  /// - Parameter pixels: An array of `PixelData` to be used in the image.
  /// - Parameter width: The width of the image.
  /// - Parameter height: The height of the image.
  ///
  /// - Note: The value of `width` * `height` must equal the size of the pixels array.
  ///         This condition is tested with an assert.
  public static func image(from pixels: [PixelData], width: Int, height: Int) -> ImageType? {
    let bitsPerComponent: Int = 8
    let bitsPerPixel: Int = 32

    assert(pixels.count == Int(width * height), "The pixel count should match the provided image size")

    var mutablePixelData = pixels
    guard let providerRef = CGDataProvider(data: NSData(bytes: &mutablePixelData, length: mutablePixelData.count * MemoryLayout<PixelData>.size)) else {
      preconditionFailure("Failed to create a CGDataProvider")
    }

    let image = CGImage(
      width: width,
      height: height,
      bitsPerComponent: bitsPerComponent,
      bitsPerPixel: bitsPerPixel,
      bytesPerRow: width * MemoryLayout<PixelData>.size,
      space: Image.colorSpace,
      bitmapInfo: Image.bitmapInfo,
      provider: providerRef,
      decode: nil,
      shouldInterpolate: true,
      intent: .defaultIntent
    )

    guard let unwrappedImage = image else {
      return nil
    }

    #if os(iOS) || os(tvOS) || os(watchOS)
      return UIImage(cgImage: unwrappedImage)
    #elseif os(OSX)
      return NSImage(cgImage: unwrappedImage, size: NSSize(width: width, height: height))
    #endif
  }
}
