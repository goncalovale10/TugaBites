import SwiftUI

struct HomeView: View {
    @EnvironmentObject var repo: LocalRecipeRepository
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 28) {
                
                // TÍTULO
                Text("Recipes Suggestions")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("GreenDark"))
                    .padding(.horizontal)
                
                // LISTA DE TODOS OS CARDS
                VStack(spacing: 32) {
                    ForEach(repo.recipes) { recipe in
                        NavigationLink(value: recipe) {
                            HomeRecipeCard(recipe: recipe)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 12)
        }
        .background(Color("BackgroundBeige").ignoresSafeArea())
        .navigationBarHidden(true)
    }
}
