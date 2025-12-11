import SwiftUI

struct HomeRecipeCard: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // IMAGEM
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            // CARD INFERIOR
            VStack(alignment: .leading, spacing: 12) {

                // TÍTULO
                Text(recipe.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)

                // TEMPO + KCAL
                HStack(spacing: 20) {
                    Label("\(recipe.prepTimeMinutes) min", systemImage: "clock")
                    Label("\(recipe.calories) kcal", systemImage: "flame")
                }
                .font(.system(size: 14))
                .foregroundColor(.gray)

                // BOTÃO
                HStack {
                    Spacer()
                    Text("View Recipe")
                        .font(.system(size: 15, weight: .medium))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(Color("GreenDark"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    Spacer()
                }
                .padding(.top, 4)

            }
            .padding(16)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}
import SwiftUI

struct HomeRecipeCard: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // IMAGEM
            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            // CARD INFERIOR
            VStack(alignment: .leading, spacing: 12) {

                // TÍTULO
                Text(recipe.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)

                // TEMPO + KCAL
                HStack(spacing: 20) {
                    Label("\(recipe.prepTimeMinutes) min", systemImage: "clock")
                    Label("\(recipe.calories) kcal", systemImage: "flame")
                }
                .font(.system(size: 14))
                .foregroundColor(.gray)

                // BOTÃO
                HStack {
                    Spacer()
                    Text("View Recipe")
                        .font(.system(size: 15, weight: .medium))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(Color("GreenDark"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    Spacer()
                }
                .padding(.top, 4)

            }
            .padding(16)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}
