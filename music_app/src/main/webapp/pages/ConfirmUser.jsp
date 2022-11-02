<%-- 
    Document   : ConfirmUser
    Created on : Sep 25, 2022, 4:38:31 PM
    Author     : hoang
--%>
<%@page import="com.oracle.music_app.login.GG_Profile"%>
<%@page import="com.oracle.music_app.model.User" %>
<%@page import="com.oracle.music_app.login.FB_Profile"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Confirm User</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../assets/css/style-login-reg.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet">
    </head>
    <body>
        <%  
            User user = new User(); 
            String access_token=(String)request.getParameter("access_token");
            if(access_token != null){
                user = new FB_Profile().call_me(access_token);
            }else{
                String code = request.getParameter("code");
                user = new GG_Profile().call_me(code);
            }
        %>
        <div class="signup">
            <div class="logo">
                <p>
                    <i class="fa-solid fa-music"></i>
                    Music
                </p>
            </div>         
            <!-- sign up with -->
            <div class="container">
                <p class="container__header">Sign up for free to start listening.</p>
                 <!-- create account -->
                 <div class="form">
                     <form action="" method="POST" class="form-register">
                        <!-- form sign up -->
                        <div class="user-address">
                            <p class="form__user">What's your email?</p>
                            <input type="text" 
                                   placeholder="Enter your email." 
                                   class="form__input-user" 
                                   value="<%=user.getEmail() %>"
                                   name="email" required>
                        </div>

                        <div class="user-email-again">
                            <p class="form__email-again">Confirm your email</p>
                            <input type="text" 
                                   placeholder="Enter your email again." 
                                   class="form__input-email-again" 
                                   value="<%=user.getEmail()%>"
                                   name="email_confirm" required>
                        </div>

                        <div class="user-password">
                            <p class="form__password">Create a password</p>
                            <input type="password" placeholder="Create a password." class="form__input-password" name="password" required>
                        </div>

                        <div class="user-profile-name">
                            <p class="form__profile-name">What should we call you?</p>
                            <input type="text" 
                                   placeholder="Enter a profile name." 
                                   class="form__input-profile-name" 
                                   value="<%=user.getFull_name()%>"
                                   name="username" required>
                            <p class="helpText">This appears on your profile.</p>
                        </div>
                        <div class="signup-btn">
                            <button class="btn btn--signup">Sign up</button>
                        </div>
                    </form>

                    <p class="login">
                        Have an account?
                        <a href="./login.html">Login</a>.
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>

