import Foundation

private let apiURL = "https://run.mocky.io/v3/d26d86ec-fb82-48a7-9c73-69e2cb728070"

/*
 Json Contract
[
  {
    "id": 1,
    "name": "Shakira",
    "photoURL": "https://api.adorable.io/avatars/285/a1.png"
  }
]
*/

class ListContactService: ListContactServiceProtocol {
    
    let session: URLSessionProtocol
    
    static let shared = ListContactService()
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchContacts(completion: @escaping (Result<[Contact], APIError>) -> Void) {
        guard let api = URL(string: apiURL) else {
            return
        }
        
        session.fetchData(with: api) { (data, response, error) in
            guard let jsonData = data else {
                completion(.failure(.networkError))
                return
            }
            
            do {
                let decoded = try Contact.parseFromData(jsonData, type: Contact.self)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
}

enum APIError: Error {
    case networkError
    case decodeError
}
