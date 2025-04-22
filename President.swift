struct President: Identifiable, Codable {
    var id: Int { number }

    let name: String
    let number: Int
    let startDate: String
    let endDate: String
    let nickname: String
    let politicalParty: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case number = "Number"
        case startDate = "Start Date"
        case endDate = "End Date"
        case nickname = "Nickname"
        case politicalParty = "Political Party"
        case url = "URL"
    }
}
