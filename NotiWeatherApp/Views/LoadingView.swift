//
//  LoadingView.swift
//  NotiWeatherApp
//
//  Created by Giuseppe Iodice 2022/12/10.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView() 
            .progressViewStyle(CircularProgressViewStyle(tint: .systemGray))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
