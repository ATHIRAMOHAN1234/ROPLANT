
<%-- 
    Document   : ViewPlacingOrder
    Created on : 20 Mar, 2019, 12:06:38 AM
    Author     : User
--%>



<%@include file="../Guest/Header1.jsp" %>
<br>
<br>
<br>
<br>
<br>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view faq</title>
        <style>
                customers
                {
                    font-family:"Trebuchet Ms",Arial Helvetica,sans-serif;
                    border-collapse:collapse;
                    width:100%;
                }
                #customers td,#customers th{
                        border: 1px solid #add;
                        padding: 8px;
                    
                }
                #customers tr:nth-child(even){background-color:pink}
                #customers tr:hover{background-color: #add;}
                #customers th{
                    padding-top:12px;
                    padding-bottom: 12px;
                    text-align:left;
                    background-color:#4CAF50;
                    color:white;
                    
                    
                }
                
                
                
            </style>
    </head>
    <body>
        <center>
             <table>
                 <tr>
                     <th><img src="../User/h.jpg" alt="14.jpg" width="300" height="170"></th></tr>
       
        </table>
         </center>
        
   <form name="frmvieworder" action="" method="POST" >
       <center> <table border="2" align="center" id="customers">
                    <tr>
                        <td colspan="5" align="center"><b>FAQ</b></td>

                    </tr>

             <tr>
                      
                        <th>USERNAME</th>
                        
                        <th>QUESTIONS</th>
                        <th> DATE</th>
                        <th>TIME</th>
                       
             </tr>  

                   <%
                   String fname="";
                   String fcomment="";
                   String fdate="";
                   String ftime="";
                   String fid ="";
                   
                   
                   String accid ="",msg="";
                 
           
            accid = request.getParameter("accid");

            if (accid != null) {

               String upQry="update tbl_faq set faq_status='1' where faq_id='"+accid+"' and '"+fid+"' ";
                boolean bol = obj.executeCommand(upQry);
                    out.println(bol);
                    if (bol == true) {
                        //out.println(upQry);
                        msg = "Record Saved...";
                       
                    } else {
                        msg = "";
                        out.println(upQry);
                    }
                    //out.println(deptid);
                }
           
            String sel =  "select * from tbl_faq f inner join tbl_userreg u on f.user_id = u.user_id ";
                   System.out.println(sel);
                    ResultSet rs = obj.selectCommand(sel);
                  while (rs.next()){
                     fname = rs.getString("user_name");
                     fcomment = rs.getString("faq_text");
                     fdate = rs.getString("faq_date");
                     ftime=rs.getString("faq_time");
                     fid = rs.getString("faq_id");
                        
                  
                         %>  
                         
                          
         <tr>
                    <td><%=fname%></td>
                    <td><%=fcomment%></td>
                    <td> <%=fdate%> </td>
                    <td><%=ftime%></td
         <tr><td><a href="ViewFaq.jsp?accid=<%=rs.getString("faq_id")%>">VERIFY</a></td>
         <td><a href="AnswerFaqs.jsp?fid=<%=rs.getString("faq_id")%>">RESPOND</a></td>
         </tr>        
               
                
                <%
                  }
                  %>
            
              </table>
       </center>
              </form>
        <a href="../Admin/HomePage.jsp">Back<<<</a>
    </body>
</html>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file="../Guest/Footer.jsp" %>



