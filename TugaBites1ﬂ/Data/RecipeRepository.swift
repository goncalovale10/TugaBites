import Foundation
import Combine
import SwiftUI

protocol RecipeRepository: ObservableObject {
    var recipes: [Recipe] { get }
    func reload()
}

final class LocalRecipeRepository: RecipeRepository {
    @Published private(set) var recipes: [Recipe] = []

    init() {
        reload()
    }

    func reload() {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            print("❌ ERROR: recipes.json not found in bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)

            // Decodificar primeiro de forma "segura"
            let decoder = JSONDecoder()

            let decoded = try decoder.decode([Recipe].self, from: data)

            print("✅ Loaded \(decoded.count) recipes from JSON.")

            // Agora validar cada receita individual
            let validated = decoded.compactMap { validateRecipe($0) }

            print("📌 Valid recipes: \(validated.count) / \(decoded.count)")
            self.recipes = validated

        } catch {
            print("❌ JSON DECODING ERROR:")
            print(error)
            self.recipes = []
        }
    }

    // MARK: - Recipe Validation
    private func validateRecipe(_ recipe: Recipe) -> Recipe? {
        var isValid = true

        // Validate name
        if recipe.name.trimmingCharacters(in: .whitespaces).isEmpty {
            print("❌ ERROR: Recipe ID \(recipe.id) has an empty name.")
            isValid = false
        }

        // Validate image exists in assets
        if UIImage(named: recipe.imageName) == nil {
            print("⚠️ WARNING: Image \"\(recipe.imageName)\" NOT FOUND for recipe \(recipe.name)")
        }

        // Validate category
        if Category(rawValue: recipe.category.rawValue) == nil {
            print("❌ ERROR: Invalid category \"\(recipe.category)\" in recipe \(recipe.name)")
            isValid = false
        }

        // Validate ingredients
        if recipe.ingredients.isEmpty {
            print("⚠️ WARNING: Recipe \(recipe.name) has NO INGREDIENTS.")
        }

        // Validate preparation steps
        if recipe.steps.isEmpty {
            print("⚠️ WARNING: Recipe \(recipe.name) has NO STEPS.")
        }

        // Validate time
        if recipe.prepTimeMinutes <= 0 {
            print("⚠️ WARNING: Recipe \(recipe.name) has invalid prep time: \(recipe.prepTimeMinutes) min.")
        }

        // Validate calories
        if recipe.calories <= 0 {
            print("⚠️ WARNING: Recipe \(recipe.name) has invalid calorie count: \(recipe.calories).")
        }

        return isValid ? recipe : nil
    }
}
