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

/// A protocol used to define a reusable element, such as a table or collection view cell, which has a NIB associated with it.
protocol NibReusable: NibInstantiable, Reusable { }


#if canImport(UIKit)

extension NibReusable where Self: UITableViewCell {
    
    /// Registers a reusable table view cell Nib for use in a table view.
    ///
    /// - parameter tableView: The table view to register the Nib with.
    static func registerReusableNib(for tableView: UITableView) {
        let nib = UINib(nibName: Self.nibName, bundle: Self.nibBundle)
        tableView.register(nib, forCellReuseIdentifier: Self.reusableIdentifier)
    }
}

extension NibReusable where Self: UITableViewHeaderFooterView {
    
    /// Registers a reusable table view header/footer view Nib for use in a table view.
    ///
    /// - parameter tableView: The table view to register the Nib with.
    static func registerReusableNib(for tableView: UITableView) {
        let nib = UINib(nibName: Self.nibName, bundle: Self.nibBundle)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Self.reusableIdentifier)
    }
}

extension NibReusable where Self: UICollectionViewCell {
    
    /// Registers a reusable collection view cell Nib for use in a collection view.
    ///
    /// - parameter collectionView: The collection view to register the Nib with.
    static func registerReusableNib(for collectionView: UICollectionView) {
        let nib = UINib(nibName: Self.nibName, bundle: Self.nibBundle)
        collectionView.register(nib, forCellWithReuseIdentifier: Self.reusableIdentifier)
    }
}

extension NibReusable where Self: UICollectionReusableView {
    
    /// Registers a reusable collection view supplementary view Nib for use in a collection view.
    ///
    /// - parameter collectionView: The collection view to register the Nib with.
    /// - parameter elementKind: The kind of element the supplementary view represents.
    static func registerReusableNib(for collectionView: UICollectionView, ofKind elementKind: String) {
        let nib = UINib(nibName: Self.nibName, bundle: Self.nibBundle)
        collectionView.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: Self.reusableIdentifier)
    }
    
    /// Registers a reusable collection view decoration view Nib for use in a collection view.
    ///
    /// - parameter collectionViewLayout: The collection view layout to register the Nib with.
    /// - parameter elementKind: The kind of element the decoration view represents.
    static func registerReusableNib(for collectionViewLayout: UICollectionViewLayout, ofKind elementKind: String) {
        let nib = UINib(nibName: Self.nibName, bundle: Self.nibBundle)
        collectionViewLayout.register(nib, forDecorationViewOfKind: elementKind)
    }
}

#endif
