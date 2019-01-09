import XCTest
import StagLayout

class Tests: XCTestCase {
    
    func test_oneItemFullWidth() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(1.0, 1.0)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 1, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
    }

    func test_twoItemsFullWidth() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(1.0, 1.0)], itemSpacing: 4)
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

    func test_repeatingRatios() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(1.0, 1.0), (1.0, 1.0), (1.0, 1.0)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 3, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 200 + 8, width: 100, height: 100)
        )
    }

    func test_nonRepeatingRatios() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(1.0, 1.0)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 3, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 200 + 8, width: 100, height: 100)
        )
    }

    func test_twoItemsHalfWidth() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(0.5, 0.5), (0.5, 0.5)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 2, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
        )
    }

    func test_twoItemsVariableWidth_1() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(0.05, 0.5), (0.95, 0.5)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 2, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 5 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 5 + 2, y: 0, width: 95 - 2, height: 50)
        )
    }

    func test_twoItemsVariableWidth_2() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(0.15, 0.5), (0.85, 0.5)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 2, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 15 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 15 + 2, y: 0, width: 85 - 2, height: 50)
        )
    }

    func test_twoItemsVariableWidth_3() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(0.8, 0.5), (0.2, 0.5)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 2, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 80 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 80 + 2, y: 0, width: 20 - 2, height: 50)
        )
    }

    func test_twoItemsVariableWidth_4() {
        let frameHolder = StagLayoutFrameHolder(widthHeightRatios: [(0.95, 0.5), (0.05, 0.5)], itemSpacing: 4)
        frameHolder.prepare(itemCount: 2, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 95 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 95 + 2, y: 0, width: 5 - 2, height: 50)
        )
    }

    func test_threeItems_1() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(0.5, 0.5), (0.5, 0.5), (1.0, 1.0)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 3, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 50 + 4, width: 100, height: 100)
        )
    }

    func test_threeItems_2() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 0.5)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 3, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 100 + 4, width: 50 - 2, height: 50)
        )
    }

//    func test_threeItems_3() {
//        let frameHolder = StagLayoutFrameHolder(
//            widthHeightRatios: [(0.33, 0.33)],
//            itemSpacing: 4
//        )
//        frameHolder.prepare(itemCount: 3, contentWidth: 100)
//
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
//            CGRect(x: 0, y: 0, width: 33 - 2, height: 33)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
//            CGRect(x: 33 + 2, y: 0, width: 33 - 2, height: 33)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
//            CGRect(x: 66 + 4, y: 0, width: 33 - 2, height: 33)
//        )
//    }

    func test_threeItems_4() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(0.5, 0.5), (0.5, 0.5), (1, 0.8)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 3, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 50 + 4, width: 100, height: 80)
        )
    }

    // 0.5:0.5, 0.5:1.5, 0.5:1
//    func test_threeItems_5() {
//        let frameHolder = StagLayoutFrameHolder(
//            widthHeightRatios: [(0.5, 0.5), (0.5, 0.5), (1, 0.8)],
//            itemSpacing: 4
//        )
//        frameHolder.prepare(itemCount: 3, contentWidth: 100)
//
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
//            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
//            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
//            CGRect(x: 0, y: 50 + 4, width: 100, height: 80)
//        )
//    }

    // 4 items, 1:1, 0.5:0.5, 0.5:0.5, 1:0.8
    func test_fourItems_1() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 0.5), (1, 0.8)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 4, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 100 + 4, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
            CGRect(x: 0, y: 154 + 4, width: 100, height: 80)
        )
    }

    // 4 items, 0.5:0.5, 0.5:0.5, 1:0.8, 1:1
    func test_fourItems_2() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(0.5, 0.5), (0.5, 0.5), (1.0, 0.8), (1.0, 1.0)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 4, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 50 + 4, width: 100, height: 80)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
            CGRect(x: 0, y: 134 + 4, width: 100, height: 100)
        )
    }

//    // 4 items, 1:1, 0.5:0.5, 0.5:1.5, 0.5:1
//    func test_fourItems_3() {
//        let frameHolder = StagLayoutFrameHolder(
//            widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (1.0, 0.8), (1.0, 1.0)],
//            itemSpacing: 4
//        )
//        frameHolder.prepare(itemCount: 4, contentWidth: 100)
//
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
//            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
//            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
//            CGRect(x: 0, y: 50 + 4, width: 100, height: 80)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
//            CGRect(x: 0, y: 134 + 4, width: 100, height: 100)
//        )
//    }

//    // 4 items, 0.5:0.5, 0.5:1.5, 0.5:1, 1:1
//    func test_fourItems_4() {
//        let frameHolder = StagLayoutFrameHolder(
//            widthHeightRatios: [(0.5, 0.5), (0.5, 0.5), (1.0, 0.8), (1.0, 1.0)],
//            itemSpacing: 4
//        )
//        frameHolder.prepare(itemCount: 4, contentWidth: 100)
//
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
//            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
//            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 50)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
//            CGRect(x: 0, y: 50 + 4, width: 100, height: 80)
//        )
//        XCTAssertEqual(
//            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
//            CGRect(x: 0, y: 134 + 4, width: 100, height: 100)
//        )
//    }

    // 5 items, 1:1, 0.68:0.68, 0.32:0.68, 0.32:0.68, 0.68:0.68
    func test_fiveItems_1() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(1.0, 1.0), (0.68, 0.68), (0.32, 0.68), (0.32, 0.68), (0.68, 0.68)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 5, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 68 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 68 + 2, y: 100 + 4, width: 32 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
            CGRect(x: 0, y: 172 + 4, width: 32 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 4, section: 0))?.frame,
            CGRect(x: 32 + 2, y: 172 + 4, width: 68 - 2, height: 68)
        )
    }

    func test_fiveItems_2() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(0.68, 0.68), (0.32, 0.68), (0.32, 0.68), (0.68, 0.68), (1.0, 1.0)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 5, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 68 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 68 + 2, y: 0, width: 32 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 68 + 4, width: 32 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
            CGRect(x: 32 + 2, y: 68 + 4, width: 68 - 2, height: 68)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 4, section: 0))?.frame,
            CGRect(x: 0, y: 140 + 4, width: 100, height: 100)
        )
    }

    func test_fiveItems_3() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 1.0), (0.5, 1.0), (0.5, 0.5)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 5, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 100, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 0, y: 100 + 4, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 100 + 4, width: 50 - 2, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
            CGRect(x: 0, y: 104 + 50 + 4, width: 50 - 2, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 4, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 100 + 4 + 100 + 4, width: 50 - 2, height: 50)
        )
    }

    func test_fiveItems_4() {
        let frameHolder = StagLayoutFrameHolder(
            widthHeightRatios: [(0.5, 0.5), (0.5, 1.0), (0.5, 1.0), (0.5, 0.5), (1.0, 1.0)],
            itemSpacing: 4
        )
        frameHolder.prepare(itemCount: 5, contentWidth: 100)

        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 0, section: 0))?.frame,
            CGRect(x: 0, y: 0, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 1, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 0, width: 50 - 2, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 2, section: 0))?.frame,
            CGRect(x: 0, y: 50 + 4, width: 50 - 2, height: 100)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 3, section: 0))?.frame,
            CGRect(x: 50 + 2, y: 100 + 4, width: 50 - 2, height: 50)
        )
        XCTAssertEqual(
            frameHolder.layoutAttributesForItem(at: IndexPath(row: 4, section: 0))?.frame,
            CGRect(x: 0, y: 154 + 4, width: 100, height: 100)
        )
    }
}
    
