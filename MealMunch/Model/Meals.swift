class Meals: Codable {
    var id: Int?
    var title: String?
    var imageType: String?
    var image: String?

    public init(id: Int?, title: String?, imageType: String?, image: String?) {
        self.id = id
        self.title = title
        self.imageType = imageType
        self.image = image
    }
}
