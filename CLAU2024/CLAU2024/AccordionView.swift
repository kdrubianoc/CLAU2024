//
//  AcordionView.swift
//  CLAU2024
//
//  Created by Karla Daniela Rubiano on 1/11/24.
//

import SwiftUI

struct AccordionView: View {
    var body: some View {
        VStack {
            DisclosureGroup("Descripción del producto") {
                VStack {
                    Image(decorative: "correr")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    Text("Tenis ideales para competencias, se adaptan perfectamente a la forma del pie, permite circular el aire y estar siempre fresco.")
                        .font(.body)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AccordionView()
}
