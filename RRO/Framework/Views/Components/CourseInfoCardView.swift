//
//  CourseInfoCardView.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseInfoCardView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let course: Course
    
    var body: some View {
        NavigationStack{
            VStack {
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
                Group {
                    HStack {
                        Text(course.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding(.bottom, 8)
                    
                    HStack {
                        Text(course.description)
                            .foregroundStyle(.secondary)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }.padding(.bottom, 12)
                }
                
                Group {
                    HStack {
                        Text("Fecha")
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(course.startDate!.toISODate(), format: .dateTime.day().month().year())
                        Text("-")
                        Text(course.endDate!.toISODate(), format: .dateTime.day().month().year())
                    }.padding(.bottom, 2)
                    
                    Divider()
                    
                    HStack {

                        // Muestra el costo del curso
                        Text("Costo")

                            .foregroundStyle(.secondary)
                        Spacer()
                        if course.status == "Gratuito"{
                            Text(String(course.status))
                        } else if course.status == "De pago"{
                            Text("$" + String(course.cost))
                        }
                
                        
                    }.padding(.bottom, 2)
                    
                    Divider()
                }
                
                HStack {
                    Text("Modalidad")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(course.modality)
                }.padding(.bottom, 12)
                
                
                NavigationLink {
                    CourseDetailView(course: course)
                } label: {
                    Text("Ver más")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(4)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .foregroundStyle(Color.white)
                
                Spacer()
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                    Text(String(course.rating))
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        CourseCommentsView(course: course)
                    } label : {
                        Image(systemName: "bubble.right")
                            .tint(colorScheme == .dark ? .white : .black)
                        Text("Ver comentarios").foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 1.5)
            )
            .padding(10)
            
        }
    }
}
