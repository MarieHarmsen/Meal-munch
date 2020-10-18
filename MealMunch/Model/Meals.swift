class Meals: Codable {
    let id : Int?
    let title : String?
    let readyInMinutes : Double?
    let image : String?

    public init(id: Int?, title: String?, readyInMinutes: Double?, image: String?) {
            self.id = id
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.image = image
    }
}
