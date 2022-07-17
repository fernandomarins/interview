import Foundation

struct Contact: Codable {
    var id: Int
    var name: String = ""
    var photoURL = ""
}

extension Contact {
    static func parseFromData<T: Decodable>(_ data: Data, type: T.Type) throws -> [T] {
        let decoded = try JSONDecoder().decode([T].self, from: data)
        return decoded
    }
}
