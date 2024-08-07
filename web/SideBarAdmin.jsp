<%-- 
    Document   : SideBarAdmin
    Created on : Mar 1, 2024, 5:41:50 PM
    Author     : maingocdat
--%>

<div class="d-flex">


    <div class="d-flex flex-column flex-shrink-0 p-3 text-white"  style="height: 100vh; width: 250px; background-color: #8c8377">
        <div class="d-flex flex-column justify-content-center align-items-center">
            <img src="" alt="alt" style="width: 150px;height: 150px;border-radius: 50%;object-fit: cover;display: block"/>
            <p style="text-align: center;font-size: 20px;margin-top: 10px">Hello Manager </p>
        </div>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li >
                <a href="http://localhost:9999/ISP392-3/home" class="nav-link d-flex align-items-center" >
                    <i class="fa-solid fa-house pe-3" style="margin-right: 10px"></i>
                    Home
                </a>
            </li>
             <li >
                <a href="http://localhost:9999/ISP392-3/ManagerProcessing" class="nav-link d-flex align-items-center" >
                    <i class="fa-solid fa-chart-simple" style="margin-right: 10px"></i>
                    Reservation
                </a>
            </li>

            <li>
                <a href="http://localhost:9999/ISP392-3/dishmana" class="nav-link sidebarBtn" style="">
                    <i class="fa-brands fa-product-hunt pe-3" style="margin-right: 10px"></i>
                    Menu
                </a>
            </li>
            <li>
                <a href="http://localhost:9999/ISP392-3/ListUser" class="nav-link sidebarBtn" >
                    <i class="fa-solid fa-user pe-3" style="margin-right: 10px"></i>
                    Customers
                </a>
            </li>
            <li>
                <a href="http://localhost:9999/ISP392-3/blogmana" class="nav-link sidebarBtn" >
                    <i class="fa-solid fa-user pe-3" style="margin-right: 10px"></i>
                    Blog    
                </a>
            </li>
            <li>
                <a href="ListAll" class="nav-link sidebarBtn" >
                    <i class="fa-solid fa-list pe-3" style="margin-right: 10px"></i>
                    All
                </a>
            </li>
        </ul>
        <hr>
    </div>       


</div>
