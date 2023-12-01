//
//  PrivacyPolicyView.swift
//  RRO
//
//  Created by Azul Rosales on 30/11/23.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("Aviso de Privacidad de la Asociación Civil Roberto Ruiz Obregón")
                        .font(.title)
                        .bold()

                    Text("Identidad y Domicilio del Responsable")
                        .font(.headline)
                        .bold()

                    Text("La Asociación Civil Roberto Ruiz Obregón, con domicilio en Av. Corregidora Nte. 285, Centro, 76164 Santiago de Querétaro, Qro., es responsable del tratamiento de sus datos personales.")

                    Text("Datos Personales Recabados y Fines")
                        .font(.headline)
                        .bold()

                    Text("Recabamos los siguientes datos personales: nombre, apellido, correo electrónico, número de teléfono y lugar de residencia. Estos datos serán utilizados para los fines generales de operación de nuestra aplicación y actividades de marketing.")

                    Text("Transferencias de Datos")
                        .font(.headline)
                        .bold()

                    Text("No transferiremos sus datos personales a terceros.")

                    Text("Derechos ARCO")
                        .font(.headline)
                        .bold()
                    
                    Text("Usted tiene derecho a Acceder, Rectificar y Cancelar sus datos personales, así como a Oponerse a su tratamiento. Para ejercer estos derechos, puede comunicarse con nosotros al número +52 442 214 3033.")


                }
                

                Group {
                    Text("Revocación del Consentimiento")
                        .font(.headline)
                        .bold()
                    
                    Text("Puede revocar su consentimiento para el tratamiento de sus datos personales. Para ello, deberá solicitarlo a través del número proporcionado.")

                    Text("Limitación del Uso o Divulgación de los Datos")
                        .font(.headline)
                        .bold()

                    Text("Para limitar el uso o divulgación de sus datos personales, contacte con nosotros al número indicado.")

                    Text("Procedimiento para Ejercer Derechos ARCO y Revocación del Consentimiento")
                        .font(.headline)
                        .bold()

                    Text("Para ejercer sus derechos ARCO o revocar su consentimiento, deberá realizar una solicitud telefónica al número +52 442 214 3033.")

                    Text("Cambios al Aviso de Privacidad")
                        .font(.headline)
                        .bold()

                    Text("Este aviso de privacidad puede ser modificado en cualquier momento sin previo aviso. Estos cambios serán notificados a través de nuestra aplicación o nuestro sitio web.")

                    Text("Consentimiento")
                        .font(.headline)
                        .bold()

                }
                
                Group {
                    Text("Al proporcionar sus datos personales, declara que da su consentimiento para que estos sean tratados conforme a los términos y condiciones del presente aviso de privacidad.")

                    Text("Contacto")
                        .font(.headline)
                        .bold()

                    Text("Para cualquier duda o comentario sobre este aviso, puede contactarnos al +52 442 214 3033.")
                }
               
            }
            .padding()
        }
        .navigationBarTitle("Aviso de Privacidad", displayMode: .inline)
    }
}

//#Preview {
//    PrivacyPolicyView()
//}
