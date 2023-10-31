//
//  LoginRepository.swift
//  RRO
//
//  Created by Alan Patricio González Bernal on 25/10/23.
//
import Foundation

class LoginRepository: LoginAPIProtocol {
    let netService: NetworkAPIService
    static let shared = LoginRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func postLogin(model: Login) async -> Result<String, Error> {
        // Crea una URL para la solicitud
        if let url = URL(string: "\(API.base)\(API.routes.userLogin)"),
           let httpBody = try? JSONEncoder().encode(model) {
            
            // Configura la solicitud HTTP
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = httpBody
            
            do {
                // Realiza la solicitud de red
                let (data, response) = try await URLSession.shared.data(for: request)
                
                // Verifica la respuesta HTTP
                if let httpResponse = response as? HTTPURLResponse {
                    // Comprueba si la respuesta es un HTTP 200 a 299 (éxito)
                    if (200...299).contains(httpResponse.statusCode) {
                        // Intenta analizar la respuesta del servidor como JSON
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            // Verifica el estado en la respuesta JSON
                            if let status = json["status"] as? String {
                                if status == "success" {
                                    print("Inicio de sesión exitoso")
                                    // Intenta obtener el ID del usuario desde la respuesta
                                    if let data = json["data"] as? [String: Any],
                                       let user = data["user"] as? [String: Any],
                                       let id = user["id"] as? String {
                                        print("El ID del usuario es:", id)
                                        // Maneja el ID según tus necesidades
                                        return .success(id)
                                    } else {
                                        return .failure(URLError(.unknown))
                                    }
                                } else {
                                    return .failure(URLError(.unknown))
                                }
                            } else {
                                return .failure(URLError(.unknown))
                            }
                        } else {
                            return .failure(URLError(.unknown))
                        }
                    } else {
                        print("Error en la respuesta del servidor: Estado HTTP \(httpResponse.statusCode)")
                        return .failure(URLError(.unknown))
                    }
                } else {
                    print("Error en la respuesta del servidor: No se recibió una respuesta HTTP válida")
                    return .failure(URLError(.unknown))
                }
            } catch {
                print("Error de Red")
                return .failure(error)
            }
        } else {
            print("Error desconocido")
            return .failure(URLError(.unknown))
        }
    }
}
