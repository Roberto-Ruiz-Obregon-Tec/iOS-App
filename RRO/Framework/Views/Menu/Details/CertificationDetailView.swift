import SwiftUI

struct CertificationDetailView: View {
    var certification: Certification
    @State var admin = false

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                HStack {
                    Text(certification.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                }
                
                Text(certification.description)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
        .navigationTitle(certification.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CertificationDetailViewPreview: PreviewProvider {
    static var previews: some View {
        CertificationDetailView(certification: Certification(
            id: "1",
            name: "Sample Certification",
            description: "This is a sample certification description."
        ))
    }
}
