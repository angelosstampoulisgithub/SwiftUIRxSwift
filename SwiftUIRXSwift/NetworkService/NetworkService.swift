//
//  NetworkService.swift
//  SwiftUIRXSwift
//
//  Created by Angelos Staboulis on 6/10/25.
//

import Foundation
import RxSwift
import RxCocoa
class NetworkService {
    func fetchUsers() -> Observable<[User]> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return Observable.error(URLError(.badURL))
        }

        return URLSession.shared.rx.data(request: URLRequest(url: url))
            .map { data in
                try JSONDecoder().decode([User].self, from: data)
            }
    }
}
