//
//  RowViewModel.swift
//  AlamofireAppCreated
//
//  Created by Sandhya Kollati on 19/08/22.
//

import Foundation
protocol RowViewModel {}


protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
