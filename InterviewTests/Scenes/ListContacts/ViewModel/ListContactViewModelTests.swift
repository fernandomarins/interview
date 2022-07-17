import XCTest
@testable import Interview

class ListContactViewModelTests: XCTestCase {
    
    var sut: ListContactsViewModel!

    override func setUp() {
        super.setUp()
        sut = ListContactsViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
//    func testHandle
}
