pragma solidity >=0.5.16 <0.9.0;

contract TaskManager {
    uint public nTasks;

    enum TaskPhase {ToDo, InProgress, Done, Blocked, Review, Postponed, Canceled}

    struct TaskStruct {
        address owner;
        string name;
        TaskPhase phase;
        uint priority;
    }

    TaskStruct[] private tasks;

    mapping (address => uint[]) private myTasks;

    event TaskAdded(address owner, string name, TaskPhase phase, uint priority);

    modifier onlyOwner (uint _taskIndex) {
        if (tasks[_taskIndex].owner == msg.sender) {
            _;
        }
    }
}