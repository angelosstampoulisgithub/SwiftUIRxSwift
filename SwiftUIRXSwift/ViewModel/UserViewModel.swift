//
//  UserViewModel.swift
//  SwiftUIRXSwift
//
//  Created by Angelos Staboulis on 6/10/25.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftUI
import Combine
class UserViewModel:ObservableObject {
    
    private let service = NetworkService()
    private let disposeBag = DisposeBag()

    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchUsers() {
        isLoading = true
        errorMessage = nil

        service.fetchUsers()
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] users in
                    self?.users = users
                    self?.isLoading = false
                },
                onError: { [weak self] error in
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                }
            )
            .disposed(by: disposeBag)
    }
}
