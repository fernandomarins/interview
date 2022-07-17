import Foundation

protocol ListContactsViewModelProtocol {
    func loadContacts(_ completion: @escaping ([Contact]?, APIError?) -> Void)
}

class ListContactsViewModel: ListContactsViewModelProtocol {
    
    private let service: ListContactServiceProtocol
    
    private var completion: (([Contact]?, APIError?) -> Void)?
    
    init(_ service: ListContactServiceProtocol = ListContactService.shared) {
        self.service = service
    }
    
    func loadContacts(_ completion: @escaping ([Contact]?, APIError?) -> Void) {
        self.completion = completion
        service.fetchContacts { [weak self] result in
            switch result {
            case .success(let contacts):
                self?.completion?(contacts, nil)
            case .failure(let error):
                self?.completion?(nil, error)
            }
        }
    }
}
