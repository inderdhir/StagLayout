import XCTest
import StagLayout

class Tests: XCTestCase {
    
    func test_oneItemFullWidth() {
        let frameHolder = StagLayoutFrameHolder(ratios: [1.0], itemSpacing: 4)
        frameHolder.prepare(itemCount: 1, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
    }

    func test_twoItemsFullWidth() {
        let frameHolder = StagLayoutFrameHolder(ratios: [1.0], itemSpacing: 4)
        frameHolder.prepare(itemCount: 2, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 100, height: 100)
        )
    }

//    func test_twoItemsHalfWidth() {
//        let frameHolder = StagLayoutFrameHolder(ratios: [0.5, 0.5], itemSpacing: 4)
//        frameHolder.prepare(itemCount: 1, contentWidth: 100)
//
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
//            CGRect(x: 0, y: 0, width: 50 - 2, height: 50 - 2)
//        )
//    }
}
