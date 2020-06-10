<%--
  Created by IntelliJ IDEA.
  User: jamesbean
  Date: 2020/6/8
  Time: 10:58 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>员工列表</title>
    <%--
     springmvc 处理静态资源：
    1.为什么会有这样的问题
    如果dispatchSevlet 映射配置为/
    则spring mvc 将捕获web容器的所有请求 包括静态资源的请求 会将他们当做一个普通的请求处理
    2.解决 在springmvc 的 配置文件中进行配置
    <mvc:default-servlet-handler/>
    --%>
    <script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
    <script>
      $(function () {
        $(".delete").click(function () {
          var href = $(this).attr("href");
          $("form").attr("action",href).submit();
          return false;
        });
      });
    </script>
  </head>
  <body>

  <form action="" method="POST">
    <input type="hidden" name="_method" value="DELETE">
  </form>


  <c:if test="${empty requestScope.employees}">
    没有任何员工信息
  </c:if>
  <c:if test="${!empty requestScope.employees}">
    <table border="1" cellpadding="10" cellspacing="0">
      <tr>
        <th>ID</th>
        <th>LastName</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Department</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
      <c:forEach items="${requestScope.employees}" var="emp">
        <tr>
          <td>${emp.id}</td>
          <td>${emp.lastName}</td>
          <td>${emp.email}</td>
          <td>${emp.gender == 0 ? 'Female':'Male'}</td>
          <td>${emp.department.departmentName}</td>
          <td><a href="emp/${emp.id}">编辑</a></td>
          <td><a class="delete" href="emp/${emp.id}">删除</a></td>
        </tr>

      </c:forEach>
    </table>
  </c:if>

  <br><br>

  <a href="emp">Add New Employee </a>

  </body>
</html>
