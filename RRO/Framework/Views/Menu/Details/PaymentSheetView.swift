//
//  PaymentSheetView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PaymentSheetView: View {
    @State var isPresented = false
    @State private var image: Image? = Image(systemName: "photo.fill")
    @State private var uiImage: UIImage?
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentCamera = false
    
    @State var actionSheetPresented = false
    
    @State var imageData: Data?
    
    @State var showingAlert = false
    
    @State var course: Course
    @StateObject var viewModel = CourseViewModel()
    var body: some View {
        
        ScrollView {
            
            WebImage(url: URL(string: course.courseImage))
                .placeholder(Image("DefaultImage").resizable())
                .resizable()
                .cornerRadius(16)
                .scaledToFit()
                .padding(.top)
            
            Text("Inscripcion para:")
                .font(.title)
                .fontWeight(.bold)
            
            Text(course.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Divider()
            
            HStack {
                Text("Por favor realice una transferencia a la siguiente cuenta y suba una foto de su comprobante de pago.")
                    .font(.headline)
                    
                Spacer()
            }
            
            Divider()
            
            HStack {
                Text("Banco")
                    .fontWeight(.bold)
                Spacer()
                Text("Nombre del banco")
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            HStack {
                Text("Importe")
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("$" + String(course.cost) + " MXN")
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            HStack {
                Text("Cuenta")
                    .fontWeight(.bold)
                Spacer()
                Text("XXXXXXXXXX")
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            HStack {
                Text("Sucursal")
                    .fontWeight(.bold)
                Spacer()
                Text("XXXX")
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            HStack {
                Text("CLAVE")
                    .fontWeight(.bold)
                Spacer()
                Text("XXXX XXXX XXXX XXXXXX")
                    .foregroundStyle(.secondary)
            }
            
            Divider()
            
            if uiImage != nil {
                Image(uiImage: uiImage!)
                    .resizable()
                    .cornerRadius(16)
                    .scaledToFit()
                    .frame(maxHeight: 200)
            }
            
            Button {
                self.actionSheetPresented = true
            } label: {
                Text("Elegir foto")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(4)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundStyle(Color.white)
            .confirmationDialog("Subir foto", isPresented: $actionSheetPresented) {
                Button("Seleccionar del album de fotos") {
                    self.shouldPresentImagePicker = true
                    self.shouldPresentCamera = false
                }
                Button("Tomar foto") {
                    self.shouldPresentImagePicker = true
                    self.shouldPresentCamera = true
                }
            }
            .sheet(isPresented: $shouldPresentImagePicker, content: {
                if self.shouldPresentCamera {
                    ImagePickerView(sourceType: .camera, image: $image, uiImage: $uiImage, isPresented: $shouldPresentImagePicker)
                } else {
                    ImagePicker(image: $uiImage)
                }
            })
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.messageTitle),
                      message: Text(viewModel.messageBody),
                      dismissButton: .default(Text("OK")))
            }
            
            if uiImage != nil {
                Button {
                    // TODO: Subir foto al back
                    showingAlert = true
                } label: {
                    Text("Subir foto")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(4)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .foregroundStyle(Color.white)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Éxito"),
                        message: Text("El comprobante se subió correctamente, por favor espere para que sea aprovado"),
                        dismissButton: .default(Text("OK")))
                }
            }
            
            Spacer()
            
        }.padding()
        
        // Pagar
        
        
    }
}


struct PaymentSheetViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentSheetView(course: Course(id: UUID().uuidString, name: "curso", description: "desc", speaker: "perdo", schedule: "6:00", modality: "remoto", status: "De pago", cost: 200, courseImage: "", capacity: 3, remaining: 3, rating: 3.2, meetingCode: "zoom", accessCode: "soom", focus: []))
        }
    }
}

