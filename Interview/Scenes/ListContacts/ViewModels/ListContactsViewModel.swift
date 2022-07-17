import Foundation

class ListContactsViewModel {
    
    private let service: ListContactServiceProtocol
    
    private var completion: (([Contact]?, Error?) -> Void)?
    
    init(_ service: ListContactServiceProtocol = ListContactService.shared) {
        self.service = service
    }
    
    func loadContacts(_ completion: @escaping ([Contact]?, Error?) -> Void) {
        self.completion = completion
        service.fetchContacts { contacts, err in
            self.handle(contacts, err)
        }
    }
    
    private func handle(_ contacts: [Contact]?, _ error: Error?) {
        if let e = error {
            completion?(nil, e)
        }
        
        if let contacts = contacts {
            completion?(contacts, nil)
        }
    }
}
