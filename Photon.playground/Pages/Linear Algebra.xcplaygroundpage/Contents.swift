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

/*:
 [Previous](@previous)
 ****
 # Linear Algebra
 
 At the heart of the ray tracing process is linear algebra. Vectors and matrices
 provide the mathematical basis of ray tracing by allowing you to easily and
 efficiently represent rays and perform calculations on them.
 
 Photon uses two structs for calculating with vectors: `Vector2D` and `Vector3D`.
 It's easy to calculate the sum of two vectors, for example:
 */

import Foundation
import Photon

let v1 = Vector2D(1.0, 2.0)
let v2 = Vector2D(3.0, 4.0)

let vectorAddition = v1 + v2

//:  ****
//:  [Next](@next)
