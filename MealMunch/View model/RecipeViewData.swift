import Foundation

final class RecipeViewData: NSObject, RecipiesViewData {
    var meals: [Meals]? {
        return recipesResponse.meals
    }
    var totalResults: Int? {
        return recipesResponse.totalResults
    }
    var offset: Int? {
        return recipesResponse.offset
    }
    var number: Int? {
        return recipesResponse.number
    }

    subscript(index: Int) -> Meals? {
        return meals?[index]
    }

    private let recipesResponse: Recipe
    init?(recipeResponse recipesResponse: Recipe?) {
        guard let recipesResponse = recipesResponse else { return nil }
        self.recipesResponse = recipesResponse
    }
}
