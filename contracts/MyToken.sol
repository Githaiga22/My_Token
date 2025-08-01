// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MyToken {
    string public _name = "GoldToken";
    string public _symbol = "GTK";
    uint8 public decimals = 18;

    uint256 public _totalSupply;

    mapping(address => uint256) public _balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 initialSupply) {
        _totalSupply = initialSupply * 10 ** uint256(decimals);
        _balanceOf[msg.sender] = _totalSupply;
    }

    function name() public view returns(string memory){
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balanceOf[account];
    }


    function transfer(address _to, uint256 _value) external returns (bool) {
        require(_balanceOf[msg.sender] >= _value, "Not enough balance");

        emit Transfer(msg.sender, _to, _value);

        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;

        return true;
    }

    function _allowance(address owner, address spender) public view returns (uint256) {
        return allowance[owner][spender];
    }

    function approve(address _spender, uint256 _value) external returns (bool) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external returns (bool) {
        require(_balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Not allowed");

        emit Transfer(_from, _to, _value);

        _balanceOf[_from] -= _value;
        _balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        return true;
    }

    function mint(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        _totalSupply += amount;
        _balanceOf[to] += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(uint256 amount) public {
        require(_balanceOf[msg.sender] >= amount, "Insufficient balance");
        _balanceOf[msg.sender] -= amount;
        _totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}