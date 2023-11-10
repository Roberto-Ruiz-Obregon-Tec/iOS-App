//
//  CourseDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetailView: View {
    var course: Course
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 8) {
                    if course.courseImage != "" {
                        WebImage(url: URL(string: course.courseImage))
                            .resizable()
                            .cornerRadius(16)
                            .scaledToFit()
                    } else {
                        Image("DefaultImage")
                            .resizable()
                            .cornerRadius(16)
                            .scaledToFit()
                    }
                    HStack {
                        Text(course.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "person.fill")
                        Text(course.speaker)
                            .fontWeight(.bold)
                        Spacer()
                        Text(String(course.rating))
                        Image(systemName: "star.fill")
                    }
                    
                    VStack(spacing: 8) {
                        HStack{
                            Image(systemName: "calendar")
                            Text("Fecha:")
                        }
                        
                        HStack {
                            
                            
                            Text(course.startDate!.toISODate(), format: .dateTime.day().month().year())
                            Text("-")
                            Text(course.endDate!.toISODate(), format: .dateTime.day().month().year())
                            
                            
                            
                        }
                    }
                    .padding(.vertical)
                    .font(.title3)
                    .fontWeight(.bold)
                    
                    VStack(spacing: 8) {
                        
                        HStack {
                            Text("Detalles")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        HStack {
                            Text(course.description)
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                        }
                    }
                
                    
                    VStack {
                        
                        Divider()
                        
                        HStack {
                            Text("Modalidad")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(course.modality)
                                .foregroundStyle(.secondary)
                        }
                        
                        
                        
                        if course.modality == "Presencial"{
                            Divider()
                            HStack {
                                Text("Ubicación")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                HStack {
                                    Image(systemName: "location")
                                    Text(String(course.location!))
                                }.foregroundStyle(.secondary)
                            }

                        }
                                            
                        
                        Divider()
                        
                        HStack {
                            Text("Horario")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(course.schedule)
                                .foregroundStyle(.secondary)
                        }
                        
                        Divider()
                        
                        
                        if course.status == "Gratuito"{
                            HStack {
                                Text("Costo")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                HStack {
                                    Text(String(course.status))
                                }.foregroundStyle(.secondary)
                                
                            }
                        }
                        else{
                            HStack {
                                Text("Costo")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text("$" + String(course.cost) + " MXN")
                                    .foregroundStyle(.secondary)
                            }
                        }

                        
                        Divider()
                        
                        HStack {
                            Text("Cupos disponibles")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            HStack {
                                Text(String(course.capacity))
                            }.foregroundStyle(.secondary)
                            
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Fecha limite de inscripción")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            HStack {
                                Text(course.startDate!.toISODate(), format: .dateTime.day().month().year())
                            }.foregroundStyle(.secondary)
                            
                        }
                        
                    }.padding(.vertical)
                    
                    
                    
                }.padding(.horizontal)
                
               
                
                NavigationLink {
                    PaymentSheetView()
                } label: {
                    Text("Inscribeme")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(4)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .foregroundStyle(Color.white)
                
                Spacer()
            }
        }
    }
}


struct CourseDetailViewPreviews: PreviewProvider{
    static var previews: some View{
        CourseDetailView(course: Course(id:UUID().uuidString, name: "Curso de Escritura", description: "Lleva tus habilidades para crear artesanias al siguiente nivel, aprende a pintar con acuarelas y tecnicas de dibujo.",speaker: "Tu mama", startDate: Date.now.toString(), endDate: Date.now.toString(), schedule: "16:00", modality: "Remoto", postalCode: 38193, location: "Calle Max Henriquez Ureña #88, apartamento 401jik dxhtdt hdiuhtndgiuhid cshdgifuide uhinntihukgicfic dicg cgdicgidc c cgihd i d d cgicg cgicgi c", status: "De pago", cost: 1200, courseImage: "https://www.grupocibernos.com/hubfs/gestion-de-proyectos-empresariales.jpg", capacity: 1, rating: 3.4, meetingCode: "hola", accessCode: "ahol", focus: []))
    }
}
