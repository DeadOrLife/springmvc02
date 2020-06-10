<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: jamesbean
  Date: 2020/6/8
  Time: 10:58 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
  <head>
    <title>员工列表</title>
  </head>
  <body>






  <%-- springmvc的表单标签 这里使用form标签 为什么使用这个呢 可以更快的开发出表单页面 而且可以 更方便的回显数据 --%>

  <form:form action="${pageContext.request.contextPath }/emp" method="POST" modelAttribute="employee">
    <%--path 属性对应html 表单也没得name属性值--%>
    <c:if test="${employee.id == null}">
      LastName: <form:input path="lastName"></form:input>
    </c:if>
    <c:if test="${employee.id != null}">
      <form:hidden path="id"></form:hidden>
      <input type="hidden" name="_method" value="PUT">
    </c:if>
    <br>
    Email:<form:input path="email"></form:input>
    <br>
    <%
      Map<String,String> genders = new HashMap<String, String>();
      genders.put("1","Male");
      genders.put("0","Female");
      request.setAttribute("genders",genders);
    %>

    Gender:<form:radiobuttons path="gender" items="${genders}"></form:radiobuttons>
    <br>
    Department:<form:select path="department.id"
                            items="${departments}"
                            itemLabel="departmentName"
                            itemValue="id"></form:select>

    <br>
    <%--
      1.数据类型转换
      2.数据类型格式化
      3.数据校验
    --%>
    Birth:<form:input path="birth"/>
    <br>
    Salary:<form:input path="salary"/>
    <br>
    <input type="submit" value="sumbit">
  </form:form>

  </body>
</html>
