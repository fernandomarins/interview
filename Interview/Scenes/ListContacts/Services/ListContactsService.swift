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
protocol ListContactServiceProtocol {
    func fetchContacts(completion: @escaping ([Contact]?, Error?) -> Void)
}

class ListContactService: ListContactServiceProtocol {
    
    let session: URLSession
    
    static let shared = ListContactService()
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchContacts(completion: @escaping ([Contact]?, Error?) -> Void) {
        guard let api = URL(string: apiURL) else {
            return
        }
        
        let task = session.dataTask(with: api) { (data, response, error) in
            guard let jsonData = data else {
                return
            }
            
            do {
                let decoded = try Contact.parseFromData(jsonData, type: Contact.self)
                completion(decoded, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
