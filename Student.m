classdef Student
    properties
        ID
        Name
        Age
        GPA
        Major
    end
    
    methods
        % Constructor to initialize a student
        function obj = Student(ID, Name, Age, GPA, Major)
            if nargin > 0
                obj.ID = ID;
                obj.Name = Name;
                obj.Age = Age;
                obj.GPA = GPA;
                obj.Major = Major;
            end
        end
        
        % Method to display student info
        function displayInfo(obj)
            fprintf('ID: %s\n', obj.ID);
            fprintf('Name: %s\n', obj.Name);
            fprintf('Age: %d\n', obj.Age);
            fprintf('GPA: %.2f\n', obj.GPA);
            fprintf('Major: %s\n', obj.Major);
        end
        
        % Method to update GPA
        function obj = updateGPA(obj, newGPA)
            obj.GPA = newGPA;
        end
    end
end
