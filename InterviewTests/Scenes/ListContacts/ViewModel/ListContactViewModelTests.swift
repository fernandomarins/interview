import XCTest
@testable import Interview

class ListContactViewModelTests: XCTestCase {
    
    var mockService: ListContactService!
    var sut: ListContactsViewModel!
    
    func testLoadContactsSuccessfully() {
        mockService = ListContactService(session: ListContactServiceMock())
        sut = ListContactsViewModel(mockService)
        sut.loadContacts { contacts, _ in
            XCTAssertEqual(contacts?[0].id, 2)
        }
    }
    
    func testLoadContactsUnsuccessfully() {
        mockService = ListContactService(session: ListContactServiceMockError())
        sut = ListContactsViewModel(mockService)
        sut.loadContacts { contacts, error in
            XCTAssertEqual(error, APIError.networkError)
        }
    }
}
