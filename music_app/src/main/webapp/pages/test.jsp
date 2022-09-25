<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <form method="POST" action="/music_app/Insert">
         <table border="0">
            <tr>
               <td>id</td>
               <td><input type="text" name="id" value="" /></td>
            </tr>
            <tr>
               <td>Name</td>
               <td><input type="text" name="name" value="" /></td>
            </tr>
            <tr>
               <td colspan="2">                   
                   <input type="submit" value="Submit" />
                   <a href="productList">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
</body>
</html>