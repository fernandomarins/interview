import XCTest
@testable import Interview

class ListContactServiceTests: XCTestCase {
    
    var sut: ListContactService!

    override func setUp() {
        super.setUp()
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testShouldReturnOk() {
        sut = ListContactService(session: ListContactServiceMock())
        var result: Result<[Contact], APIError>?
        
        sut.fetchContacts {
            result = $0
        }
        
        switch result {
        case .success(let contacts):
            XCTAssertEqual(contacts[0].id, 2)
        default:
            XCTFail("Unexpected result")
        }
    }
    
    func testShouldReturnError() {
        sut = ListContactService(session: ListContactServiceMockError())
        var result: Result<[Contact], APIError>?
        sut.fetchContacts {
            result = $0
        }
        
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, APIError.networkError)
        default:
            XCTFail("Unexpected result")
        }
    }
    
    func testParseShouldBeOk() throws {
        let data = mockData!
        let decodedData = try Contact.parseFromData(data, type: Contact.self)
        XCTAssertEqual(decodedData[0].id, 2)
    }
}


var mockData: Data? {
    """
    [{
      "id": 2,
      "name": "Beyonce",
      "photoURL": "https://api.adorable.io/avatars/285/a2.png"
    }]
    """.data(using: .utf8)
}
