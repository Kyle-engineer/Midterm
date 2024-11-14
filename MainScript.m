% Main script
clc;
clear;

% Initialize database
db = StudentDatabase();

% Add some students
student1 = Student('S001', 'Alice', 20, 3.7, 'Computer Science');
student2 = Student('S002', 'Bob', 22, 3.9, 'Electrical Engineering');
student3 = Student('S003', 'Charlie', 21, 3.5, 'Computer Science');
db = db.addStudent(student1);
db = db.addStudent(student2);
db = db.addStudent(student3);

% Find student by ID
studentFound = db.findStudentByID('S002');
if ~isempty(studentFound)
    disp('Student Found:');
    studentFound.displayInfo();
end

% Save to file
db.saveToFile('studentDatabase.mat');

% Load from file
db2 = db.loadFromFile('studentDatabase.mat');

% Generate visualizations
generateVisualizations(db2);
