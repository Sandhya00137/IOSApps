////
////  NewModel.swift
////  AlamofireAppCreated
////
////  Created by Sandhya Kollati on 21/08/22.
////
//
import Foundation
struct NewViewModel : Codable {
    let rowViewModels: [RowViewModel]
    enum CodingKeys: RowViewModel ,CodingKey {
        case rowViewModels
    }
    init(rowViewModels : [RowViewModel]) {
        self.rowViewModels = rowViewModels
    }
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy : CodingKeys.self)
        rowViewModels = try container.decode([RowViewModel].self, forKey: .rowViewModels)
    }


}
