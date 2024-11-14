function generateVisualizations(db)
    % GPA distribution histogram
    GPAs = arrayfun(@(x) x.GPA, db.students);
    figure;
    histogram(GPAs, 'FaceColor', 'b');
    title('GPA Distribution');
    xlabel('GPA');
    ylabel('Frequency');

    % Average GPA by major
    majors = unique(arrayfun(@(x) x.Major, db.students, 'UniformOutput', false));
    avgGPA = zeros(1, length(majors));
    for i = 1:length(majors)
        majorStudents = db.getStudentsByMajor(majors{i});
        avgGPA(i) = mean(arrayfun(@(x) x.GPA, majorStudents));
    end
    
    figure;
    bar(avgGPA);
    set(gca, 'XTickLabel', majors);
    title('Average GPA by Major');
    xlabel('Major');
    ylabel('Average GPA');
    
    % Age distribution
    ages = arrayfun(@(x) x.Age, db.students);
    figure;
    histogram(ages, 'FaceColor', 'r');
    title('Age Distribution');
    xlabel('Age');
    ylabel('Frequency');
end
