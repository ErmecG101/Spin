<%-- 
    Document   : loja
    Created on : Nov 11, 2024, 8:12:55 PM
    Author     : Otavio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../generics/header_config.jsp"/>
    <body>
        <h1>Hello World!</h1>
        <div class="container-fluid">
            <div class="row align-items-end">
                <div class="col-md-2 div_background">
                Teste
                </div> 
            <div class="col-md-10">
                  <a href="#" class="img_action">
                <div class="card bg-dark text-white img_holder">
                    <img src="../icons/temp/ready_or_not.jpg" class="card-img img_holder_image" alt="...">
                    <div class="card-img-overlay img_text">
                      <h5 class="card-title">Ready Or Not</h5>
                      <p class="card-text">Publicado por: </p>
                      <p class="card-text">R$ 89,90</p>
                    </div>
                  </div>
            </a>
                    <a href="#" class="img_action">
                <div class="card bg-dark text-white img_holder">
                    <img src="../icons/temp/ready_or_not.jpg" class="card-img img_holder_image" alt="...">
                    <div class="card-img-overlay img_text">
                      <h5 class="card-title">Ready Or Not</h5>
                      <p class="card-text">Publicado por: </p>
                      <p class="card-text">R$ 89,90</p>
                    </div>
                  </div>
            </a>
            </div>
            </div>
            
                   
        </div>
           
                
            
        
        
    </body>
    
    <style>
        
        .div_background{
            background-color: rgba(125,125,125,.2) ;
            border-radius: 8px;
            height: inherit
        }
        
        .img_holder{
            height: 300px;
            width: 300px;
            transition: all 100ms ease-in;
        }
        
        .img_holder:hover{
            transform: scale(1.03);
        }
        
        .img_action{
            width: fit-content;
            transition: all 100ms ease-in;
            display: inline-block
        }
        
        .img_action:active .img_holder{
            transform: scale(.98);
        }
        
        .img_holder_image{
            transition: all 100ms ease-in;
        }
        
        .img_holder:hover .img_holder_image{
            filter: blur(3px);
        }
        
        .img_text {
            background-color: rgba(0,0,0,.70);
            transition: all 100ms ease-in;
            opacity: 0;
        }
        
        .img_holder:hover .img_text{
            opacity: 1;
        }
        
    </style>
</html>
