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

/// A protocol used to define a reusable element, such as a table or collection view cell.
protocol Reusable {
    
    /// An identifier that can be used to identify reusable elements.
    static var reusableIdentifier: String { get }
}


extension Reusable {
    
    /// The default implementation returns the name of the class as the identifier.
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}


#if canImport(UIKit)

extension Reusable where Self: UITableViewCell {
    
    /// Registers a reusable cell class with a table view.
    ///
    /// - Parameter tableView: The table view to register the cell class with.
    static func registerReusableCell(forTableView tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: Self.reusableIdentifier)
    }
    
    /// Dequeues a reusable table view cell at an index path.
    ///
    /// - parameter tableView: The table view to dequeue the cell from.
    /// - parameter indexPath: The index path to associate with the dequeued cell.
    /// - returns: A reusable table view cell.
    static func dequeueReusableCell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> Self {
        return tableView.dequeueReusableCell(withIdentifier: Self.reusableIdentifier, for: indexPath) as! Self
    }
}


extension Reusable where Self: UITableViewHeaderFooterView {
    
    /// Registers a reusable header/footer view with a table view.
    ///
    /// - parameter tableView: The table view to register the view class with.
    static func registerReusableView(forTableView tableView: UITableView) {
        tableView.register(self, forHeaderFooterViewReuseIdentifier: Self.reusableIdentifier)
    }
    
    /// Dequeues a reusable table view header/footer view.
    ///
    /// - parameter tableView: The table view to dequeue the view from.
    /// - returns: A reusable table view header/footer view.
    static func dequeueReusableView(forTableView tableView: UITableView) -> Self {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: Self.reusableIdentifier) as! Self
    }
}


extension Reusable where Self: UICollectionViewCell {
    
    /// Registers a reusable cell class with a collection view.
    ///
    /// - parameter collectionView: The collection view to register the cell class with.
    static func registerReusableCell(forCollectionView collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: Self.reusableIdentifier)
    }
    
    /// Dequeues a reusable collection view cell at an index path.
    ///
    /// - parameter collectionView: The collection view to dequeue the cell from.
    /// - parameter indexPath: The index path to associate with the dequeued cell.
    /// - returns: A reusable collection view cell.
    static func dequeueReusableCell(forCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: Self.reusableIdentifier, for: indexPath) as! Self
    }
}


extension Reusable where Self: UICollectionReusableView {
    
    /// Registers a reusable supplementary view class with a collection view.
    ///
    /// - parameter collectionView: The collection view to register the supplementary view class with.
    /// - parameter elementKind: The kind of element that this view represents.
    static func registerReusableSupplementaryView(forCollectionView collectionView: UICollectionView, ofElementKind elementKind: String) {
        collectionView.register(self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: Self.reusableIdentifier)
    }
    
    /// Dequeues a reusable supplementary view of a particular element kind.
    ///
    /// - parameter collectionView: The collection view to dequeue the cell from.
    /// - parameter elementKind: The kind of element that this view represents.
    /// - parameter indexPath: The index path to associate with the supplementary view.
    /// - returns: A reusable supplementary view.
    static func dequeueReusableSupplementaryView(forCollectionView collectionView: UICollectionView, ofElementKind elementKind: String, atIndexPath indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: Self.reusableIdentifier, for: indexPath) as! Self
    }
    
    /// Registers a reusable decoration view class with a collection view.
    ///
    /// - parameter collectionView: The collection view to register the decoration view class with.
    /// - parameter elementKind: The kind of element that this view represents.
    static func registerReusableDecorationView(forCollectionView collectionView: UICollectionView, ofElementKind elementKind: String) {
        collectionView.register(self, forDecorationViewOfKind: elementKind)
    }
}

#endif
