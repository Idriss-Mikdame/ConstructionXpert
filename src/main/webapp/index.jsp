<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    .navbar {
        background: white;
        font-family: calibri;
        padding-right: 15px;
        padding-left: 15px;
    }

    .navdiv {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo {
        font-size: 35px;
        font-weight: 600;
    }

    .logo a {
        color: rgb(0, 0, 0);
        text-decoration: none;
    }

    .menu {
        list-style: none;
        display: flex;
    }

    .menu li {
        position: relative;
        padding: 10px; /* Keep the padding */
    }

    .menu li .link  {
        color: rgb(0, 0, 0);
        font-size: 15px;
        font-weight: 600;
        text-decoration: none;
        padding: 10px;
        display: block; /* Make the link fill the li */
    }

    .menu li:hover .submenu {
        display: block;
    }

    .submenu {
        display: none;
        position: absolute;
        background: white;
        list-style: none;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        z-index: 1; /* Ensure submenu appears on top */
    }

    .submenu li {
        padding: 5px 10px;
    }

    .submenu li a {
        white-space: nowrap;
        display: block; /* Ensure link fills the list item */
    }

    ul button {
        background-color: rgb(0, 0, 0);
        margin-left: 30px;
        margin-top: 8px;
        border-radius: 10px;
        padding: 5px;
        width: 140px;
        border: none;

    }

    button a {
        text-decoration: none;
        color: white;
        font-weight: 600;
        font-size: 15px;
    }

    header {
        width: 100%;
        height: 93vh;
        background: url('img2.jpg') no-repeat;
        background-size: cover;
        font-family: sans-serif;
    }

    .text {
        max-width: 650px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        color: white;
    }

    .text span {
        letter-spacing: 5px;
    }

    .text h1 {
        font-size: 3.5em;
    }

    .text a {
        text-decoration: none;
        background: rgb(0, 0, 0);
        padding: 10px 50px;
        letter-spacing: 5px;
        color: white;
        transition-duration: 1s;

    }

    .text a:hover {
        background-color: azure;
        color: black;
    }
</style>
<body>
<nav class="navbar">
    <div class="navdiv">
        <div class="logo"><a href="index.jsp">ConstructionXpert</a></div>
        <ul class="menu">
            <li>
                <a class="link" href="index.jsp">Home</a>
            </li>
            <li>
                <a class="link" href="projet?action=new">Projet</a>
                <ul class="submenu">
                    <li><a class="link" href="projet?action=new">Ajouter</a></li>
                    <li><a class="link" href="projet?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="tache?action=new">Tache</a>
                <ul class="submenu">
                    <li><a class="link" href="tache?action=new">Ajouter</a></li>
                    <li><a class="link" href="tache?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="ressource?action=new">Ressource</a>
                <ul class="submenu">
                    <li><a class="link" href="ressource?action=new">Ajouter</a></li>
                    <li><a class="link" href="ressource?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <button><a href="logout">Logout</a></button>
            </li>
        </ul>
    </div>
</nav>


<header>

    <SEction class="text">
        <span>Bienvenue</span>
        <h1>construction de votre maison</h1><br>
        <a href="projet?action=afficher">Projet</a>
        <a href="tache?action=afficher">Tache</a>
        <a href="ressource?action=afficher">Ressource</a>
    </SEction>
</header>

</body>
</html>