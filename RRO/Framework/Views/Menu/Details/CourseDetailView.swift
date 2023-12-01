//
//  CourseDetailView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetailView: View {
    @StateObject var viewModel = CourseViewModel()
    var course: Course
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 8) {
                    
                    WebImage(url: URL(string: course.courseImage))
                        .placeholder(Image("DefaultImage").resizable())
                        .resizable()
                        .cornerRadius(16)
                        .scaledToFit()
                        .padding(.top)
                    
                    
                    Group {
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
                    }
                    
                    
                    VStack(spacing: 8) {
                        HStack{
                            Image(systemName: "calendar")
                            Text("Fecha:")
                        }
                        
                        HStack {
                            
                            
                            Text(course.startDate!.toISODate(), format: .dateTime.day().month())
                            Text("-")
                            Text(course.endDate!.toISODate(), format: .dateTime.day().month())
                            
                            
                            
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
                                            
                        Group {
                            Divider()
                            
                            HStack {
                                Text("Horario")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text(course.schedule)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Divider()
                        }
   
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

                        Group {
                            Divider()
                            
                            HStack {
                                Text("Cupos disponibles")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                HStack {
                                    Text(String(course.remaining))
                                }.foregroundStyle(.secondary)
                                
                            }
                            
                            Divider()
                        }
                        
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
                
                if course.remaining > 0 {
                    if course.status == "Gratuito" {
                        
                        Button {
                            if course.remaining > 0 {
                                Task {
                                    await viewModel.createCourseInscription(courseId: course.id, voucher: nil)
                                }
                            } else {
                                
                            }
                        } label: {
                            Text("Inscribeme")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(4)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .foregroundStyle(Color.white)
                        .alert(isPresented: $viewModel.showAlert) {
                            Alert(title: Text(viewModel.messageTitle),
                                  message: Text(viewModel.messageBody),
                                  dismissButton: .default(Text("OK")))
                        }
                    } else {
                        NavigationLink {
                            if course.remaining > 0 {
                                PaymentSheetView()
                                
                            } else {
                                
                            }
                        } label: {
                            Text("Inscribeme")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding(4)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .foregroundStyle(Color.white)
                    }
                } else {
                    Text("No hay cupo")
                        .font(.headline)
                        .tint(.red)
                        .foregroundStyle(Color.white)
                }
                
                Spacer()
            }
        }
    }
}



