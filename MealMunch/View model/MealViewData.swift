import Foundation

final class MealViewData: NSObject, MealsViewData {
    var id: Int? {
        return mealsResponse[0].id
    }
    var title: String? {
        return mealsResponse[0].title
    }
    var imageType: String? {
        return mealsResponse[0].imageType ?? ""
    }
    var image: String? {
        return mealsResponse[0].image ?? ""
    }

    private let mealsResponse: [Meals]
    init?(mealsResponse: [Meals]?) {
        guard let mealsResponse = mealsResponse else { return nil }
        self.mealsResponse = mealsResponse
    }
}

