//
//  AppRow.swift
//  DemoApp
//
//  Created by liang on 2022/5/19.
//

import SwiftUI

struct AppRow: View {
    @ObservedObject var appModel: AppModel
    var body: some View {
        HStack {
            FetchableImage(imageUrl: appModel.iconUrl)
                .frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading) {
                Text(appModel.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(appModel.description)
                    .font(.subheadline)
                    .lineLimit(2)
            }
            Image(systemName: appModel.isFavorite ? "heart.fill" : "heart")
                .foregroundColor(appModel.isFavorite ? .red : .black)
                .onTapGesture {
                    appModel.isFavorite.toggle()
                    debugPrint("favorite: \(appModel.isFavorite)")
                }
        }
        .padding(10)
    }
}

struct AppRow_Previews: PreviewProvider {
    static var previews: some View {
        AppRow(appModel: DataManager().appList[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
