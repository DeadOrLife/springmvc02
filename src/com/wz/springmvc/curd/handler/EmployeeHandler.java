package com.wz.springmvc.curd.handler;

import com.wz.springmvc.curd.dao.DepartmentDao;
import com.wz.springmvc.curd.dao.EmployeeDao;
import com.wz.springmvc.curd.entities.Department;
import com.wz.springmvc.curd.entities.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @DESCRIPTION new class
 * @AUTHOR: jamesbean
 * @DATE: 2020/6/9 12:08 上午
 */
@Controller
public class EmployeeHandler {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentDao departmentDao;

    @ModelAttribute
    public void getEnoloyee(@RequestParam(value = "id",required = false) Integer id,
                            Map<String,Object> map){
        if (id != null){
            map.put("employee",employeeDao.get(id));
        }
    }


    @RequestMapping(value = "/emp",method = RequestMethod.PUT)
    public String update(Employee employee){
        employeeDao.save(employee);
        return "redirect:/emps";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public String input(@PathVariable("id") Integer id,Map<String,Object> map){
        map.put("employee",employeeDao.get(id));
        map.put("departments",departmentDao.getDepartments());
        return "input";
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id){
        employeeDao.delete(id);
        return "redirect:/emps";
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public String save(Employee employee){
        employeeDao.save(employee);
     return "redirect:/emps";
    }


    @RequestMapping(value = "emp",method = RequestMethod.GET)
    public String input(Map<String,Object> map){
        map.put("departments",departmentDao.getDepartments());
        map.put("employee",new Employee());
        return "input";
    }

    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    public String list(Map<String,Object> map){
        map.put("employees", employeeDao.getAll());
        return "list";
    }

}
