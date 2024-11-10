import SwiftUI

struct RecyView: View {
    @EnvironmentObject var viewModel: RecycleViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Consejos de Reciclaje")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.top)

                // Lista de categorías
                ForEach(viewModel.categories) { category in
                    NavigationLink(destination: CategoryDetailView(category: category)) {
                        HStack {
                            Image(systemName: category.iconName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(category.color)
                            Text(category.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                    Divider()
                }
                .padding(.horizontal)

                // Información educativa adicional
                VStack(alignment: .leading, spacing: 10) {
                    Text("Significado de Símbolos de Reciclaje")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    Text("♻️ Símbolo de reciclaje: Indica que el material es reciclable.\n🛢 Punto de recolección de pilas: Lleva las pilas a un lugar especializado.\n🟢 Vidrio: Se recicla en contenedores verdes.\n🔵 Papel: Se recicla en contenedores azules.")
                        .padding()
                        .background(Color.yellow.opacity(0.2))
                        .cornerRadius(8)

                    Text("Contenedores Comunes")
                        .font(.headline)
                        .padding(.top, 10)

                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "bottle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Botella de plástico")
                        }
                        HStack {
                            Image(systemName: "bottle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Botella de vidrio")
                        }
                        HStack {
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Lata")
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Reciclaje")
    }
}
#Preview {
    RecycleView()
}
