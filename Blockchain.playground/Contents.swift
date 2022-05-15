import UIKit

//CREATE BLOCK CLASS
class Block {
    var hash = String()
    var data = String()
    var prevHash = String()
    var index = Int()
    
    func createHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

//CREATE BLOCKCHAIN CLASS

class BlockChain {
    var chain = [Block]()
    
    func creatingGenesisBlock(data: String) {
        let gBlock = Block()
        gBlock.hash = gBlock.createHash()
        gBlock.data = data
        gBlock.prevHash = "nil - Genesis Block"
        gBlock.index = 0
        
        chain.append(gBlock)
    }
    
    func addBlock(data: String) {
        let newBlock = Block()
        newBlock.hash = newBlock.createHash()
        newBlock.data = data
        newBlock.prevHash = chain[chain.count - 1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
    
}

//CREATE CHAIN

let stvCoin = BlockChain()
stvCoin.creatingGenesisBlock(data: "From person A,to person B; Amount: 10STV")
stvCoin.addBlock(data: "From person B,to person C; Amount: 8STV")
stvCoin.addBlock(data: "From person C,to person D; Amount: 25STV")
stvCoin.addBlock(data: "From person D,to person E; Amount: 5STV")
stvCoin.addBlock(data: "From person E,to person F; Amount: 15STV")

//stvCoin.chain[2].data //Get Data

//TAMPER WITH CHAIN DATA

stvCoin.chain[2].hash = "SOMETHING"

//PRINT CHAIN DATA

for i in 0...stvCoin.chain.count - 1 {
    print("\tBlock: \(stvCoin.chain[i].index)\n\tHash: \(stvCoin.chain[i].hash)\n\tPreviousHash: \(stvCoin.chain[i].prevHash)\n\tData: \(stvCoin.chain[i].data)\n")
}

//CHECK VALIOTY OF CHAIN

var isChainValid = true

for i in 1...stvCoin.chain.count - 1 {
    if stvCoin.chain[i].prevHash != stvCoin.chain[i - 1].hash {
        isChainValid = false
    }
}

print("Chain is valid: \(isChainValid)")


/*
func checkString() -> String {
    if NSUUID().uuidString == NSUUID().uuidString {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
    return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
}

checkString()
*/
