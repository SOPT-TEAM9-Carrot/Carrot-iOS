//
//  Apply.swift
//  CDS_CarrotJob
//
//  Created by KJ on 2023/05/16.
//

import UIKit

import SnapKit
import Then

final class ApplyView: UIView, UITextViewDelegate {
    
    // MARK: - UI Components
    
    private let photoLabel = UILabel()
    private let photoButton = UIButton()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let phoneNumberLabel = UILabel()
    private let phoneNumberDetailLabel = UILabel()
    private let phoneNumberTextField = UITextField()
    private let genderLabel = UILabel()
    private let maleButton = UIButton()
    private let femaleButton = UIButton()
    private let birthDayLabel = UILabel()
    private let birthDayDetailLabel = UILabel()
    private let birthDayLabelTextField = UITextField()
    private let birthDayWarningLabel = UILabel()
    private let careerLabel = UILabel()
    private let careerButton = UIButton()
    private let introduceLabel = UILabel()
    private let introduceTextView = UITextView()
    let introduceTextViewPlaceholder = "본인이 일햇던 경험과 할 수 있는 업무에 대해 소개해주세요."
    private let introduceNumberLabel = UILabel()
    private let borderView = UIView()
    private let check1Label = UILabel()
    private let check2Label = UILabel()
    private let applyButton = OrangeUIButton()
    private let introduceView = UIView()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        introduceTextView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("ApplyView has not been implemented")
    }
}

extension ApplyView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .white
        
        photoLabel.do {
            $0.text = "사진 (선택)"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        photoButton.do {
            $0.setImage(UIImage(named: "image"), for: .normal)
        }
        nameLabel.do {
            $0.text = "이름 (선택)"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        nameTextField.do {
            $0.textColor = .black
            $0.layer.cornerRadius = 3
            $0.layer.borderWidth = 1
            $0.layer.borderColor = Color.gray6.cgColor
            $0.setLeftPaddingPoints(8)
            $0.attributedPlaceholder = NSAttributedString(
                string: "당근마켓",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor .black])
        }
        
        phoneNumberLabel.do {
            $0.text = "연락처"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        phoneNumberDetailLabel.do {
            $0.text = "전화번호는 안심번호로 표시돼요"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray2
        }
        phoneNumberTextField.do {
            $0.textColor = Color.gray1
            $0.layer.cornerRadius = 3
            $0.layer.borderWidth = 1
            $0.layer.borderColor = Color.gray6.cgColor
            $0.setLeftPaddingPoints(8)
            $0.attributedPlaceholder = NSAttributedString(
                string: "010 6686 5237",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor .black])
            $0.keyboardType = .numberPad
        }
        genderLabel.do {
            $0.text = "성별"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        maleButton.do {
            $0.setImage(UIImage(named: "man"), for: .normal)
        }
        femaleButton.do {
//            $0.setUIOfButtonFor(type: .registerCareer)
            $0.setImage(UIImage(named: "woman"), for: .normal)
        }
        birthDayLabel.do {
            $0.text = "태어난 연도"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        birthDayDetailLabel.do {
            $0.text = "태어난 연도를 숫자 4자리로 입력해주세요. 알바 프로필에는\n나이대로 표시돼요. 예)30대, 40대 등"
//            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray2
            $0.numberOfLines = 2
        }
        birthDayLabelTextField.do {
            $0.textColor = Color.gray1
            $0.layer.cornerRadius = 3
            $0.layer.borderWidth = 1
            $0.layer.borderColor = Color.gray6.cgColor
            $0.setLeftPaddingPoints(8)
            $0.attributedPlaceholder = NSAttributedString(
                string: "오이마켓",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor .black])
            $0.keyboardType = .numberPad
        }
        birthDayWarningLabel.do {
            $0.text = "ex)2023"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
            $0.textColor = Color.errorRed
        }
        careerLabel.do {
            $0.text = "경력 (선택)"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        careerButton.do {
            $0.setImage(UIImage(named: "register"), for: .normal)
        }
        introduceLabel.do {
            $0.text = "자기소개 (선택)"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        introduceTextView.do {
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font14)
            $0.textColor = Color.gray5
            $0.text = introduceTextViewPlaceholder
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = Color.gray6.cgColor
        }
        introduceNumberLabel.do {
            $0.text = "0/2000"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Bold, sizeOf: .font12)
            $0.textColor = Color.gray3
        }
        borderView.do {
            $0.backgroundColor = Color.gray7
        }
        check1Label.do {
            $0.text = "(필수) 개인정보 수집 및 이용 동의"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        check2Label.do {
            $0.text = "(필수) 개인정보 제 3자 제공 동의"
            $0.textAlignment = .center
            $0.font = .notoSansFont(weightOf: .Medium, sizeOf: .font14)
            $0.textColor = Color.gray1
        }
        applyButton.do {
            $0.setUIOfButtonFor(type: .apply)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addSubviews(photoLabel, photoButton, nameLabel, nameTextField, phoneNumberLabel, phoneNumberDetailLabel, phoneNumberTextField, genderLabel, maleButton, femaleButton, birthDayLabel, birthDayDetailLabel, birthDayLabelTextField, birthDayWarningLabel, careerLabel, careerButton, introduceLabel, introduceView, borderView, check1Label, check2Label, applyButton)
        
        introduceView.addSubviews(introduceTextView, introduceNumberLabel)
        //        introduceTextView.addSubview(introduceNumberLabel)
        
        photoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.leading.equalToSuperview().inset(15)
        }
        photoButton.snp.makeConstraints {
            $0.top.equalTo(photoLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(15)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(photoButton.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(44)
        }
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
        }
        phoneNumberDetailLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(15)
        }
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberDetailLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(44)
        }
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
        }
        maleButton.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(15)
        }
        femaleButton.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(8)
            $0.leading.equalTo(maleButton.snp.trailing).offset(2)
        }
        birthDayLabel.snp.makeConstraints {
            $0.top.equalTo(femaleButton.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
        }
        birthDayDetailLabel.snp.makeConstraints {
            $0.top.equalTo(birthDayLabel.snp.bottom).offset(0)
            $0.leading.equalToSuperview().inset(15)
        }
        birthDayLabelTextField.snp.makeConstraints {
            $0.top.equalTo(birthDayDetailLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(44)
        }
        birthDayWarningLabel.snp.makeConstraints {
            $0.top.equalTo(birthDayLabelTextField.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(19)
        }
        careerLabel.snp.makeConstraints {
            $0.top.equalTo(birthDayWarningLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
        }
        careerButton.snp.makeConstraints {
            $0.top.equalTo(careerLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(-5)
        }
        introduceLabel.snp.makeConstraints {
            $0.top.equalTo(careerButton.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(15)
        }
        introduceView.snp.makeConstraints {
            $0.top.equalTo(introduceLabel.snp.bottom).offset(8).priority(.low)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(172)
        }
        introduceTextView.snp.makeConstraints {
            $0.top.equalTo(introduceLabel.snp.bottom).offset(8).priority(.low)
//            $0.bottom.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(172)
        }
        introduceNumberLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(11)
        }
        borderView.snp.makeConstraints {
            $0.top.equalTo(introduceTextView.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(8)
        }
        check1Label.snp.makeConstraints {
            $0.top.equalTo(borderView.snp.bottom).offset(22)
            $0.leading.equalToSuperview().inset(15)
        }
        check2Label.snp.makeConstraints {
            $0.top.equalTo(check1Label.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(15)
        }
        applyButton.snp.makeConstraints {
            $0.top.equalTo(check2Label.snp.bottom).offset(45.5)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == introduceTextViewPlaceholder {
            textView.text = nil
            textView.textColor = .black
            textView.text = ""
        }
    }
        func textViewDidChange( textView: UITextView) {
            let size = CGSize(width: introduceTextView.frame.width, height: .infinity)
            let estimatedSize = textView.sizeThatFits(size)
            textView.constraints.forEach { (constraint) in
                if estimatedSize.height >= 277 {
                    if constraint.firstAttribute == .height {
                        constraint.constant = estimatedSize.height
                    }
                }
            }
            checkMaxLength(textView)
            let count = textView.text.count
            introduceNumberLabel.text = "(count)/2000자"
        }

        func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
            return true
        }
    private func checkMaxLength(_ textView: UITextView) {
            if (textView.text.count) > 2000 {
                textView.deleteBackward()
            }
        }
}
