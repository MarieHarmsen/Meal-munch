class Recipe: Codable {
    let meals : [Meals]?
    let totalResults: Int?
    let offset: Int?
    let number: Int?

    enum CodingKeys: String, CodingKey {
        case meals = "results"
        case totalResults
        case offset
        case number
    }

    public init(meals: [Meals]?, totalResults: Int?, offset: Int?, number: Int?) {
        self.meals = meals
        self.totalResults = totalResults
        self.offset = offset
        self.number = number
    }
}
