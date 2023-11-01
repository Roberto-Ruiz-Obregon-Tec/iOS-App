//
//  VoucherSheetView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import PhotosUI

struct VoucherSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State var image: Image?
    @State var inputImage: UIImage?
    @State var showingImagePicker = false
    
    @State var imageData: Data?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400)
                .edgesIgnoringSafeArea(.all)
            
            Form {
                Section(header: Text("Subir comprobante de pago")) {
                    Button {
                        self.showingImagePicker = true
                    } label: {
                        Text("Elige una foto")
                    }
                    
                    Button {
                        // TODO: Take photo
                    } label: {
                        Text("Tomar una foto")
                    }
                }
                
            }.padding(.top, 128)
            
            
            Button {
                dismiss()
            } label: {
                Text("Enviar")
                    .padding()
            }
        }
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        imageData = inputImage.jpegData(compressionQuality: 1) ?? inputImage.pngData()
        
        image = Image(uiImage: inputImage)
    }
}

struct VoucherSheetViewPreview: PreviewProvider {
    static var previews: some View {
        VoucherSheetView()
    }
}
