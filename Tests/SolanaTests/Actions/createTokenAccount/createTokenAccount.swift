import XCTest
import Solana

class createTokenAccount: XCTestCase {
    var endpoint = RPCEndpoint.devnetSolana
    var solana: Solana!
    var account: Account!

    override func setUpWithError() throws {
        let wallet: TestsWallet = .devnet
        solana = Solana(router: NetworkingRouter(endpoint: endpoint))
        account = Account(phrase: wallet.testAccount.components(separatedBy: " "), network: endpoint.network)!
    }
    
    func testCreateTokenAccount() {
        let mintAddress = "6AUM4fSvCAxCugrbJPFxTqYFp9r3axYx973yoSyzDYVH"
        let account: (signature: String, newPubkey: String)? = try! solana.action.createTokenAccount( mintAddress: mintAddress, payer: self.account)?.get()
        XCTAssertNotNil(account)
    }
    
    func testCreateAccountInstruction() {
        let instruction = SystemProgram.createAccountInstruction(from: PublicKey.programId, toNewPubkey: PublicKey.programId, lamports: 2039280, space: 165, programPubkey: PublicKey.programId)
        
        XCTAssertEqual("11119os1e9qSs2u7TsThXqkBSRUo9x7kpbdqtNNbTeaxHGPdWbvoHsks9hpp6mb2ed1NeB", Base58.encode(instruction.data))
    }
}
