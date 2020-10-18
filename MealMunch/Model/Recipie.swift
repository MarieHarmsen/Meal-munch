class Recipie: Codable {
    let meals : [Meals]?

    public init(meals: [Meals]) {
        self.meals = meals
    }
}
