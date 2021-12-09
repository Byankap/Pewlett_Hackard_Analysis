--Challenge
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


--Recent titles of emp
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.first_name,
	re.last_name,
	re.title
INTO unique_titles
FROM retirement_titles as re
ORDER BY emp_no, to_date DESC;

--retiring titles
SELECT COUNT(title),
	title
INTO retiring_titles
FROM unique_titles as u
GROUP BY title
ORDER BY title DESC;

--mentorship_eligibility
SELECT DISTINCT ON(e.emp_no) e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility 
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
