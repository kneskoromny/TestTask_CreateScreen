//
//  Alert.swift
//  TestTask_CreateScreen
//
//  Created by Кирилл Нескоромный on 16.11.2021.
//

import UIKit

struct Alert {
    static func present(
        in controller: UIViewController,
        title: String? = nil,
        message: String? = nil,
        style: UIAlertController.Style = .actionSheet,
        completion: @escaping () -> Void
    ) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let clearAction = UIAlertAction(title: "Сбросить данные",
                                        style: .default) { _ in
            completion()
            print("clear action")
        }
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .cancel) { _ in
            print("cancel action")
        }
        alertController.addAction(clearAction)
        alertController.addAction(cancelAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
}
