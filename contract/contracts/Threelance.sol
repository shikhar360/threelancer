//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error NotRegistered();

contract Users {
  uint private uid = 0 ;

  uint private pid = 0 ;


  struct User {
    uint256 userId;
    string userName;
    string bio;
    string[] acomplishments;
    uint[] myProjs;
    uint[] appliedProjs;
    address useradd;
  }

  enum STATUS {
    NOT_STARTED,
    ACTIVE,
    ENDED
  }

  struct Sub {
    string githubUrl;
    bool approved;
  }

  struct Project {
    uint projectId;
    uint bountyAmount;
    uint deadline;
    string pname;
    string desc;
    STATUS condition;
    address projOwner;
    mapping(uint => Sub) submissions;
    mapping(address => bool) assignedTo;
  }

  User[] private usersArr; 
  Project[] private projArr;

  mapping(address => bool) private hasRegistered; 
  mapping(address => uint) private addToId;

  //! Getter Functions

  function getUserByAdd() external view returns (User memory) {
    return userArr[addToId[msg.sender]];
  }

  function getAppliedProjs() external view returns (uint[] memory){
    return usersArr[addToId[msg.sender]].appliedProjs ; // filter from allprojs arr in frontend
  }

  function getAllProjs() external view returns(Project[] memory){
    return projArr;
  }

  function getProjById(uint _projId) public view returns(Project memory) {
    return projArr[_projId];
  }

  //! Setter functions

  function userReg(string memory _userName, string memory _bio) external {
    string[] memory acomp ;
    uint[] memory  mproj; 
    uint[] memory  appliedproj; 
    usersArr.push(User(uid , _userName , _bio , acomp , mproj, appliedproj,  msg.sender  )) ;
    hasRegistered[msg.sender] = true;
    addToId[msg.sender] = uid; //for getter
    uid ++;

  }

  function addProj( string memory _name , string memory _desc , uint _deadline , uint _amount  ) external onlyReg {
    if (!(hasRegistered[msg.sender])){
      revert NotRegistered();
    }

    projArr.push(Project(pid , _amount , _deadline , _name , _desc , STATUS.NOT_STARTED , msg.sender, address(0)));
    usersArr[addToId[msg.sender]].myProjs.push(pid);
    pid ++;
  }

  function applytoproj(uint _projId) external { // applybutton for all projects
    Project proj = getProjById(_projId);

    require(proj.condition == STATUS.NOT_STARTED, "Project already assigned");
    require(proj.deadline > block.timestamp, "Deadline reached");
    
    proj.condition = STATUS.ACTIVE;
    proj.assignedTo = msg.sender;

    usersArr[addToId[msg.sender]].appliedProjs.push(_projId);
  }

  

  //TODO: User can submit their work done to projects assigned
  function submitProject(uint _projId, string memory _url) external {
    Project proj - getProjById(_projId);

    require(proj.condition == STATUS.ACTIVE);
    require(proj.deadline > block.timestamp, "Deadline reached");
    require(proj.assignedTo[msg.sender] == true, "Project not assigned");

    proj.submissions[addToId[msg.sender]].githubUrl = _url;

  }

  //TODO: User can edit their submissions before deadline
  function editPToject(uint _projId, string memory _url) external {
    Project proj = getProjById(_projId);

    require(proj.submissions[addToId[msg.sender]] != "", "No project submitted yet");

    proj.submissions[addToId[msg.sender]].githubUrl = _url;
  }

  //?: User who completed a project will get a nft upon approval of the project owner (thinking)
  function approveSubmissions(uint _projId) external {
    Project proj = getProjById(_projId);

    proj.submissions[addToId[msg.sender]].approved = true;
  }

}


// reg => seeallproj => apply to added proj(add + apply) => seeappliedproj => 


//pages
// landing
// login page
// projects page ()

// project submission page (edit )

////////////////////////////////
//user

// user registeration (modal (user or client))
// user will (check out proj ,  )
// project assign project will be completed in dur time (keepers)
// page where user can see all of his submission
// user will be able to edit its projects 


// client
// submitted projects checkout 
// will be ablr to post the projects 
// will giv some type of rating to the project
// projects will get some type of nft after completion
// mark as completed after giving nft 
