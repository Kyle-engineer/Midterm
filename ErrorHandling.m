function obj = addStudent(obj, student)
    if isempty(student.ID) || isempty(student.Name) || student.Age <= 0 || student.GPA < 0 || student.GPA > 4.0
        error('Invalid student data');
    end
    obj.students = [obj.students, student];
end

function obj = loadFromFile(obj, filename)
    try
        if isfile(filename)
            loadedData = load(filename);
            obj = loadedData.obj;
        else
            error('File not found.');
        end
    catch ME
        fprintf('Error loading file: %s\n', ME.message);
    end
end
