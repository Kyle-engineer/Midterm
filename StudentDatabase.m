classdef StudentDatabase
    properties
        students = [];
    end
    
    methods
        % Add a new student
        function obj = addStudent(obj, student)
            obj.students = [obj.students, student];
        end
        
        % Find student by ID
        function student = findStudentByID(obj, studentID)
            student = [];
            for i = 1:length(obj.students)
                if strcmp(obj.students(i).ID, studentID)
                    student = obj.students(i);
                    return;
                end
            end
        end
        
        % Get list of students by major
        function list = getStudentsByMajor(obj, major)
            list = [];
            for i = 1:length(obj.students)
                if strcmp(obj.students(i).Major, major)
                    list = [list, obj.students(i)];
                end
            end
        end
        
        % Save to .mat file
        function saveToFile(obj, filename)
            save(filename, 'obj');
        end
        
        % Load from .mat file
        function obj = loadFromFile(filename)
            try
                if isfile(filename)
                    loadedData = load(filename);
                    obj = loadedData.obj;
                else
                    fprintf('File not found: %s\n', filename);
                    obj = StudentDatabase();  % return an empty database
                end
            catch ME
                fprintf('Error loading file: %s\n', ME.message);
                obj = StudentDatabase();  % return an empty database on error
            end
        end
    end
end
