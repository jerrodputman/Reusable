// MIT License
//
// Copyright (c) 2015 Jerrod Putman
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
#if canImport(UIKit)
import UIKit
#endif

/// A protocol that describes a conformer that can be instantiated from a NIB.
protocol NibInstantiable: class {
    
    associatedtype InstantiatedType = Self
    
    /// The name of the nib.
    static var nibName: String { get }
    
    /// The bundle where the nib can be found.
    static var nibBundle: Bundle? { get }
    
    /// Instantiates an object from a nib file.
    static func fromNib(withOwner owner: Any?) -> InstantiatedType?
}

extension NibInstantiable {
    
    /// The default implementation returns the name of the class.
    static var nibName: String {
        return String(describing: self)
    }
    
    /// The default implementation returns `nil`.
    static var nibBundle: Bundle? {
        return nil
    }
}


#if canImport(UIKit)

extension NibInstantiable where Self: NSObject {
    
    /// Instantiates an object using the first object in the nib.
    static func fromNib(withOwner owner: Any? = nil) -> InstantiatedType? {
        let nib = UINib(nibName: nibName, bundle: nibBundle)
        return nib.instantiate(withOwner: owner, options: nil).first as? InstantiatedType
    }
}

#endif
