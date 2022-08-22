//
//  Observable.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 17/08/22.
//

import Foundation
import UIKit

class Observable<T: Codable>: Codable {
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    enum CodingKeys: String, CodingKey
    {
        case value, valueChanged
    }
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy : CodingKeys.self)
        value = try container.decode(T.self, forKey: .value)
    }
    
    
    func encode(to encoder : Encoder)
    {
        var container = encoder.container(keyedBy : CodingKeys.self)
        do
        {
            try container.encode(value, forKey : .value)
        }
        catch
        {
            fatalError("Should never happen")
        }
    }
    
    func addObserver(fireNow: Bool = true, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}

struct CodableImage: Codable {
    
    var image: UIImage?
    
    public enum CodingKeys: String, CodingKey {
        case image
    }
    
    public init(image: UIImage?) {
        self.image = image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let b = try? container.decodeNil(forKey: CodingKeys.image), b {
            self.image = nil
        } else {
            let data = try container.decode(Data.self, forKey: CodingKeys.image)
            
            guard let image = UIImage(data: data) else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.image, in: container, debugDescription: "Decoding image failed")
            }
            self.image = image
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let data = image?.pngData() {
            try container.encode(data, forKey: CodingKeys.image)
        } else {
            try container.encodeNil(forKey: CodingKeys.image)
        }
    }
    
    public init(wrappedValue: UIImage?) {
        self.init(image: wrappedValue)
    }

    public var wrappedValue: UIImage? {
        get { image }
        set {
            image = newValue
        }
    }
    
}
