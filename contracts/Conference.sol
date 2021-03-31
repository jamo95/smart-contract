pragma solidity ^0.5.16;
contract Conference {  // can be killed, so the owner gets sent the money in the end

	address payable public organizer;
	mapping (address => uint) public registrantsPaid;
	uint public numRegistrants;
	uint public quota;

	event Deposit(address _from, uint _amount); // so you can log the event
	event Refund(address _to, uint _amount); // so you can log the event

	constructor() public {
		organizer = msg.sender;
		quota = 100;
		numRegistrants = 0;
	}

	function buyTicket() internal {
		if (numRegistrants >= quota) {
			revert(); // throw ensures funds will be returned
		}
		registrantsPaid[msg.sender] = msg.value;
		numRegistrants++;
		emit Deposit(msg.sender, msg.value);
	}

	function changeQuota(uint newquota) public {
		if (msg.sender != organizer) { return; }
		quota = newquota;
	}

	function refundTicket(address payable recipient, uint amount) public {
		if (msg.sender != organizer) { return; }
		if (registrantsPaid[recipient] == amount) {
			address myAddress = address(this);
			if (myAddress.balance >= amount) {
				recipient.transfer(amount);
				emit Refund(recipient, amount);
				registrantsPaid[recipient] = 0;
				numRegistrants--;
			}
		}
		return;
	}

	function destroy() private {
		if (msg.sender == organizer) { // without this funds could be locked in the contract forever!
			selfdestruct(organizer);
		}
	}
}
