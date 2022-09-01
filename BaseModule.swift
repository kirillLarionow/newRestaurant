//
//  BaseModule.swift
//  Restaurant
//
//  Created by кирилл ларионов on 01.09.2022.
//

import UIKit

protocol Module {
    associatedtype Input
    associatedtype Output
    
    var view: UIViewController { get }
    var input: Input? { get }
    var output: Output? { get }
    
    init(view: UIViewController, input: Input?, output: Output?)
}

final class BaseModule<Input, Output>: Module {
    var view: UIViewController
    var input: Input?
    var output: Output?
    
    required init(view: UIViewController, input: Input?, output: Output?) {
        self.view = view
        self.input = input
        self.output = output
    }
}
