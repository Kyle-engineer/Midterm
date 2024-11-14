function generateInteractivePlot(db)
    majors = unique(arrayfun(@(x) x.Major, db.students, 'UniformOutput', false));
    avgGPA = zeros(1, length(majors));
    for i = 1:length(majors)
        majorStudents = db.getStudentsByMajor(majors{i});
        avgGPA(i) = mean(arrayfun(@(x) x.GPA, majorStudents));
    end
    
    % Interactive bar plot
    figure;
    b = bar(avgGPA);
    set(gca, 'XTickLabel', majors);
    title('Average GPA by Major');
    xlabel('Major');
    ylabel('Average GPA');
    % Add interactive capability
    datacursormode on;
end
