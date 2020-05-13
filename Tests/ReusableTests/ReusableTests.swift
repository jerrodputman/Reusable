import XCTest
@testable import Reusable

final class ReusableTests: XCTestCase {
    func testDefaultReusableIdentifier() {
        struct ReusableItem: Reusable { }
        
        XCTAssertEqual(ReusableItem.reusableIdentifier, "ReusableItem")
    }
    
    func testDefaultNibInstantiable() {
        class NibInstantiableItem: NibInstantiable {
            static func fromNib(withOwner owner: Any?) -> NibInstantiableItem? {
                return nil
            }
        }
        
        XCTAssertEqual(NibInstantiableItem.nibName, "NibInstantiableItem")
        XCTAssertNil(NibInstantiableItem.nibBundle)
    }
    
    func testDefaultNibReusable() {
        class NibReusableItem: NibReusable {
            static func fromNib(withOwner owner: Any?) -> NibReusableItem? {
                return nil
            }
        }
        
        XCTAssertEqual(NibReusableItem.reusableIdentifier, "NibReusableItem")
        XCTAssertEqual(NibReusableItem.nibName, "NibReusableItem")
        XCTAssertNil(NibReusableItem.nibBundle)
    }

    static var allTests = [
        ("testDefaultReusableIdentifier", testDefaultReusableIdentifier),
        ("testDefaultNibInstantiable", testDefaultNibInstantiable),
        ("testDefaultNibReusable", testDefaultNibReusable)
    ]
}
