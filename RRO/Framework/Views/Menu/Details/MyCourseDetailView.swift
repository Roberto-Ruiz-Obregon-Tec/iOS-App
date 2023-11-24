//
//  MyCourseDetailView.swift
//  RRO
//
//  Created by user326 on 15/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyCourseDetailView: View {
    var course: Course
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 8) {
                        Group{
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
                            
                        }
                    
                        Group{
                            
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

                                else{
                                    Divider()
                                    HStack{
                                        Text("Liga a la reunión")
                                            .fontWeight(.bold)

                                        Spacer()

                                        HStack{
                                            Text(String(course.meetingCode))
                                        }.foregroundStyle(.secondary)
                                    }

                                    if course.accessCode != ""{
                                        Divider()
                                        HStack{
                                            Text("Codigo de acceso")
                                                .fontWeight(.bold)

                                            Spacer()

                                            HStack{
                                                Text(String(course.accessCode))
                                            }.foregroundStyle(.secondary)
                                        }
                                    }
                                }
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
                                Text(String(course.remaining))
                            }.foregroundStyle(.secondary)
                            
                        }
                        
                        Group{
                            Divider()
                            
                            HStack {
                                Text("Fecha limite de inscripción")
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                HStack {
                                    Text(course.startDate!.toISODate(), format: .dateTime.day().month().year())
                                }.foregroundStyle(.secondary)
                                
                            }
                        }
                    }.padding(.vertical)
                    
                }.padding(.horizontal)
                
                Spacer()
            }
        }
    }