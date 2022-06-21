import XCTest
import Solana

class getTokenWallets: XCTestCase {
    var endpoint = RPCEndpoint.devnetSolana
    var solana: Solana!
    var account: Account!

    override func setUpWithError() throws {
        let wallet: TestsWallet = .getWallets
        solana = Solana(router: NetworkingRouter(endpoint: endpoint))
        account = Account(phrase: wallet.testAccount.components(separatedBy: " "), network: endpoint.network)!
    }
    
    func testsGetTokenWallets() {
        let wallets = try? solana.action.getTokenWallets(account: account.publicKey.base58EncodedString)?.get()
        XCTAssertNotNil(wallets)
        XCTAssertNotEqual(wallets!.count, 0)
    }
}
