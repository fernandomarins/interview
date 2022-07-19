import Foundation

protocol ListContactsViewModelProtocol {
    func loadContacts(completion: @escaping (APIError?) -> Void)
    var contactsCellVieModel: [ContactCellViewModel] { get }
    var reloadTableView: (() -> Void)? { get set }
}

class ListContactsViewModel: ListContactsViewModelProtocol {
    
    private let service: ListContactServiceProtocol
    
    var contacts = [Contact]()
    var reloadTableView: (() -> Void)?
    var contactsCellVieModel = [ContactCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(_ service: ListContactServiceProtocol = ListContactService()) {
        self.service = service
    }
    
    func loadContacts(completion: @escaping (APIError?) -> Void) {
        service.fetchContacts { [weak self] result in
            switch result {
            case .success(let contacts):
                self?.convertDataFromModel(contacts: contacts)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    private func convertDataFromModel(contacts: [Contact]) {
        self.contacts = contacts
        var vms = [ContactCellViewModel]()
        for contact in contacts {
            vms.append(createCellModel(contact: contact))
        }
        contactsCellVieModel = vms
    }
    
    private func createCellModel(contact: Contact) -> ContactCellViewModel {
        let id = contact.id
        let name = contact.name
        let photoUrl = contact.photoURL
        
        return ContactCellViewModel(id: id, name: name, photoURL: photoUrl)
    }
}
