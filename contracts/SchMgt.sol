// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

error Unauthorized(address sender);

contract SchMgt {

    uint256 public studentCount;
    address public principal;

    enum Gender {male, female, other}
    enum Status {active, Inactive, graduated}

    struct Student {
        string name;
        uint8 age;
        uint8 grade;
        Gender gender;
        Status status; 
    }

    mapping(uint256 => Student) public students;

    modifier onlyPrincipal() {
        // require(msg.sender == principal, Unauthorized());
        if (msg.sender != principal) {
            revert Unauthorized(msg.sender);
        }
        _;
    }

    // functions needed
    constructor(address _principal) {
        principal = _principal;
    }

    function registerStudent (address _studentAddress, string memory _name, uint8 _age, Gender _gender) onlyPrincipal public {

        require(_studentAddress != address(0), "Invalid student address");
        require(bytes(_name).length > 0, "Name cannot be empty");

        students[studentCount] = Student({
            name: _name,
            age: _age,
            grade: 1, 
            gender: _gender,
            status: Status.active
        });
       
        studentCount++;
    }

    function getAllStudents () public view returns (Student[] memory) {
        Student[] memory _allStudents = new Student[](studentCount);

        for (uint256 i = 0; i < studentCount; i++) {
            _allStudents[i] = students[i];
        }

        return _allStudents;
    }

}