import Foundation

struct User {
    let email: String
    let token: String
}

protocol SubscriptionService {
    func isUserPro(user: User) async throws -> Bool
    func isUserPro(user: User, completion: @escaping (Result<Bool, Error>) -> Void)
}

enum SubscriptionServiceError: Error {
    case unableToVerify
}

struct UserRepository: SubscriptionService {
    let userProDataFetcher: UserProDataFetcher
    
    init(userProDataFetcher: UserProDataFetcher) {
        self.userProDataFetcher = userProDataFetcher
    }
    
    func isUserPro(user: User) async throws -> Bool {
        try await userProDataFetcher.fetch(for: user).isProUser
    }
    
    func isUserPro(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        Task {
            do {
                let isUserPro = try await isUserPro(user: user)
                completion(.success(isUserPro))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

struct UserProData: Codable {
    let email: String
    let lastTimePayedForPro: Date
    let isProUser: Bool
}

protocol UserProDataFetcher {
    func fetch(for user: User) async throws -> UserProData
}

struct FetchUserProDataRemotely: UserProDataFetcher {
    func fetch(for user: User) async throws -> UserProData {
        try await Task.sleep(nanoseconds: 4_000_000_000)
        return UserProData(
            email: "luigi@betssongroup.com",
            lastTimePayedForPro: Date(timeIntervalSince1970: 0),
            isProUser: true
        )
        
    }
}
