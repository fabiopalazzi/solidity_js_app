pragma solidity >=0.7.0 <0.9.0;

contract UserAmount{
    struct User{
        string name;
        string surname;
        uint amount;
    }

    event Eventt(address indexed sender, uint256 value);
    
    User [] userList;

    function addUser(string memory name, string memory surname, uint amount) public {
        userList.push(User(name, surname, amount));
    }
    
    function getUser() public view returns(uint count){
        count = userList.length;
    }

    function getUserAmount(string memory name, string memory surname) public view returns (uint amount, uint index){
        bool trovato = false;
        for(uint i=0; trovato==false && i<userList.length; i++){
            if(keccak256(bytes(userList[i].name)) == keccak256(bytes(name)) && keccak256(bytes(userList[i].surname)) == keccak256(bytes(surname))){
                amount = userList[i].amount;
                index = i;
                trovato = true;
            }
        }
    }

    function emitEvent(uint256 val) external {
        emit Eventt(msg.sender, val);
    }
}