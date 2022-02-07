SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
-- INTO retirement_titles
FROM employees as e
JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no, emp_no DESC;

Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
-- INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01' 
ORDER BY emp_no, to_date DESC;

SELECT COUNT(ut.emp_no), ut.title 
-- INTO retiring_titles 
FROM unique_titles as ut 
GROUP BY ut.title 
ORDER BY COUNT(ut.title) DESC;

DROP TABLE mentorship_eligibility;


SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
-- INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no 
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;




