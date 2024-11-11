import SwiftUI

struct RecycleDetailView: View {
    let item: RecycleItem

    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
//                Text(item.title)
//                    .font(.title)
//                    .bold()
                
                if let imageName = item.image {
                    HStack {
                        Spacer()
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100) // Ajusta el tamaño según lo necesario
                            .cornerRadius(12)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
                
                
                Text(item.description)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                if let youtubeLink = item.youtubeLink {
                    Link("Ver video en YouTube", destination: URL(string: youtubeLink)!)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.vertical, 10)
                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(item.title)
        }
    }
}


