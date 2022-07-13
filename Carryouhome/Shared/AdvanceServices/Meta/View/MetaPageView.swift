//
//  MetaPageView.swift
//  Carryouhome
//
//  Created by fanghe on 2021/11/27.
//

import SwiftUI

struct MetaPageView: View {
    var body: some View {
        List {
                                ForEach(0..<4) { index in
                                        Text("Tab \(index)")
                                        .font(.title)
                                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                                        .cornerRadius(8)
                                    }
        }

    }
}

struct MetaPageView_Previews: PreviewProvider {
    static var previews: some View {
        MetaPageView()
    }
}
