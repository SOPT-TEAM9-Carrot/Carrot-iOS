//
//  ExitPopupViewController.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/06/09.
//

import UIKit

import SnapKit
import Then

protocol ExitPopupDelegate: AnyObject {
    func didExit()
}

final class ExitPopupViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let exitPopupView = ExitPopupView()
    
    // MARK: - Properties
    
    weak var delegate: ExitPopupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension ExitPopupViewController {
    
    private func setUI() {
        view.backgroundColor = .clear
    }
    
    private func setLayout() {
        
        view.addSubviews(exitPopupView)
        
        exitPopupView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        exitPopupView.delegate = self
    }
}

extension ExitPopupViewController: ButtonTypeProtocol {
    
    func buttonType(type: ApplyButtonType) {
        switch type {
        case .cancel:
            self.dismiss(animated: false)
        case .exit:
            self.dismiss(animated: true) {
                self.delegate?.didExit()
            }
        }
    }
}
