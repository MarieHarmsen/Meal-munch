protocol RecipiesViewData: AnyObject {
    var meals: [Meals]? { get }
    var totalResults: Int? { get }
    var offset: Int? { get }
    var number: Int? { get }

    init?(recipeResponse: Recipe?)
}
