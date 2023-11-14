//
//  FAQView.swift
//  RRO
//
//  Created by peblo on 20/10/23.
//

import SwiftUI


/// Defines a view (FAQView) in the "RRO" app, presenting information about a foundation
struct FAQView: View {
    @StateObject var infoFundacionViewModel = FundationInformationViewModel()
    @State var info: InfoFundation?
    
    let RROred = Color(red: 0.8117647059, green: 0.1647058824, blue: 0.1647058824)
    
    
    var body: some View {
        VStack() {
            Text(info?.name ?? "")
                .bold()
                .font(.title2)
            Image("logoFundacion")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                .padding()
            
            Divider()
                .padding(10)
            
            Text(info?.description ?? "...")
                .font(.headline)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            
            Divider()
            
            Text("Nuestras Redes")
                .bold()
                .foregroundColor(RROred)
                .padding()
            
            HStack(spacing: 20) {
                // Iconos para las redes sociales como botones interactivos
                Button(action: {
                    if let url = URL(string: info?.facebook ?? "") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("Facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    if let url = URL(string: info?.instagram ?? "") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("Instagram")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    if let url = URL(string: info?.tiktok ?? "") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("Tiktok")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    if let url = URL(string: info?.twitter ?? "") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("Twitter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom)
            
            Divider()
            
            Text("Contáctanos")
                .bold()
                .foregroundColor(RROred)
                .padding(.top)

            
            VStack(spacing: 15) {
                Text("📞   \(info?.phone ?? "#")")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(RROred)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(RROred, lineWidth: 2))
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Text("✉️   \(info?.email ?? "mail@gmail.com")")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(RROred)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(RROred, lineWidth: 2))
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Text("📍")
                Text(info?.location ?? "#")
                    .font(.footnote)
            }
            .padding(15)
            .padding(.bottom)
         
            
        }
        .padding(10)
        .onAppear {
            Task {
                await infoFundacionViewModel.getInfoFundation()
                if !infoFundacionViewModel.infoFundation.isEmpty {
                    
                    info = infoFundacionViewModel.infoFundation[0]
                }
                
            }
        }
        
    }
}


struct FAQViewPreview: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}

