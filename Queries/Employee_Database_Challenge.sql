-- Deliverable 1: The Number of Retiring Employees by Title
-- retrieve employee retirement info
SELECT emp_no, first_name, last_name
FROM employees

SELECT title, from_date, to_date
FROM titles

-- Create retirement_titles table
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Retrieve unique retirement titles
SELECT emp_no, first_name, last_name, title
FROM retirement_titles;

-- Create unique_titles table
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Retrieve number of unique titles 
SELECT COUNT(title) title
FROM unique_titles
GROUP BY title;

-- Create retiring_titles table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT *
FROM retiring_titles;

-- # roles needed filled
SELECT SUM(count)
FROM retiring_titles;


-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- Retrieve employee eligibility info
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp; 

SELECT title 
FROM titles;

-- Create mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
	de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE de.to_date = '9999-01-01' AND e.birth_date BETWEEN '1965-1-1' AND '1965-12-31' 
ORDER BY e.emp_no;

SELECT	*
FROM mentorship_eligibility;

-- mentorship eligibility by title
SELECT COUNT(title), title
FROM mentorship_eligibility
GROUP BY title 
ORDER BY COUNT(title) DESC;











