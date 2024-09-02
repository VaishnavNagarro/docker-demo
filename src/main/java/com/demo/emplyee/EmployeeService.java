package com.demo.emplyee;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeService {

    private final List<Employee> employees = new ArrayList<>();
    private int currentId = 1;

    public List<Employee> getAllEmployees() {
        return employees;
    }

    public Employee createEmployee(String name, String department) {
        Employee newEmployee = new Employee(currentId++, name, department);
        employees.add(newEmployee);
        return newEmployee;
    }
}
