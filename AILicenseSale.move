pragma MOVE;

contract AILicenseSale {
    address public owner;
    uint256 public price;
    bool public licenseSold;

    fun deploy() {
        owner = msg.sender;
        price = 1000 * 10**18; // 1000 APTs
    }

    fun buy_license() payable {
        // Require that the payment is for the correct amount
        require(move(msg.amount) == price, "Incorrect payment amount.");
        // Require that the license has not already been sold
        require(!move(licenseSold), "License already sold.");
        licenseSold = true;
        // Transfer the payment to the contract owner
        move(owner).transfer(move(msg.amount));
    }
}
