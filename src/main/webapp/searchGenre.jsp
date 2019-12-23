<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
Map hiveResult = (Map<String, Object>)request.getAttribute("hive");
Map mysqlResult = (Map<String, Object>)request.getAttribute("mysql");
Map neo4jResult = (Map<String, Object>)request.getAttribute("neo4j");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Search According to Genre</title>
    <link rel="icon" href="img/favicon.ico" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name=viewport content="width=device-width, initial-scale=1" />
    <link href="semantic/dist/semantic.min.css" rel="stylesheet" />
    <link href="plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="plugins/datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="plugins/weather-icons/css/weather-icons-wind.min.css" rel="stylesheet" />
    <link href="plugins/weather-icons/css/weather-icons.min.css" rel="stylesheet" />
    <link href="plugins/chartist/chartist.min.css" rel="stylesheet" />
    <link href="css/chat-page.css" rel="stylesheet" />
    <link rel="shortcut icon" href="img/favicon.ico" />

</head>

<body>
<div id="contextWrap">
    <div class="ui sidebar vertical left menu overlay  borderless visible sidemenu inverted  blue" style="-webkit-transition-duration: 0.1s; transition-duration: 0.1s;">
        <div class="ui accordion inverted">

            <a class="title item"href="home.html">
                <i class="icon ion-paper-airplane titleIcon icon"></i>
                Home
            </a>

            <a class="title item">
                <i class="icon ion-ios-search titleIcon icon"></i>
                <i class="dropdown icon"></i> Search
            </a>
            <div class="content">
                <a class="item" href="searchTime.jsp">
                    Time
                </a>
                <a class="item" href="searchTitle.jsp">
                    Title
                </a>
                <a class="item" href="searchDirector.jsp">
                    Director
                </a>
                <a class="item" href="searchActor.jsp">
                    Actor
                </a>
                <a class="item" href="searchGenre.jsp">
                    Genres
                </a>
                <a class="item" href="searchPartnership.jsp">
                    Partnership
                </a>
                <a class="item" href="searchCooperationMovie.jsp">
                    Cooperation Movie
                </a>
                <a class="item" href="searchAudience.jsp">
                    Audience
                </a>
                <a class="item" href="integratedSearch.jsp">
                    Integrated Search
                </a>
            </div>
            <a class="title item">
                <i class="icon ion-ios-color-filter-outline titleIcon icon"></i>
                Compare&Analysis
            </a>
        </div>
    </div>
</div>
<div class="pusher">
    <div class="mainWrap navslide">
        <div class="ui equal width left aligned padded grid stackable">
            <div class="divider"></div>
            <h3 class="ui header">Genre Search</h3>
            <div class="row">
                <div class="sixteen wide column">
                    <div class="ui segments">
                        <div class="ui segment">
                            <h4 class="ui dividing header">Setting genre</h4>
                            <form class="ui form" action="genreSearch" method="post">
                                <div class="field">
                                    <label>Genres</label>
                                    <div class="ui selection dropdown">
                                        <input type="hidden" name="genre">
                                        <div class="default text">Genre</div>
                                        <i class="dropdown icon"></i>
                                        <div class="menu">
                                            <div class="item" data-value="0">Action & Adventure</div>
                                            <div class="item" data-value="1">Classics</div>
                                            <div class="item" data-value="2">Foreign Language & International & Foreign Films</div>
                                            <div class="item" data-value="3">Indian Cinema & Bollywood</div>
                                            <div class="item" data-value="4">Indie & Art House</div>
                                            <div class="item" data-value="5">Kids & Family</div>
                                            <div class="item" data-value="6">LGBTQ</div>
                                            <div class="item" data-value="7">Music Videos & Concerts</div>
                                            <div class="item" data-value="8">Western</div>
                                            <div class="item" data-value="9">Animation & Anime & Manga</div>
                                            <div class="item" data-value="10">Arts & Entertainment</div>
                                            <div class="item" data-value="11">Beauty & Fashion</div>
                                            <div class="item" data-value="12">Comedy</div>
                                            <div class="item" data-value="13">Documentary</div>
                                            <div class="item" data-value="14">Drama</div>
                                            <div class="item" data-value="15">Educational</div>
                                            <div class="item" data-value="16">Exercise & Fitness</div>
                                            <div class="item" data-value="17">Faith & Spirituality</div>
                                            <div class="item" data-value="18">Fantasy</div>
                                            <div class="item" data-value="19">Food & Drink</div>
                                            <div class="item" data-value="20">Gaming</div>
                                            <div class="item" data-value="21">Health</div>
                                            <div class="item" data-value="22">Home & Garden</div>
                                            <div class="item" data-value="23">Horror</div>
                                            <div class="item" data-value="24">Military & War</div>
                                            <div class="item" data-value="25">Musicals</div>
                                            <div class="item" data-value="26">Mystery & Thrillers</div>
                                            <div class="item" data-value="27">Performing Arts</div>
                                            <div class="item" data-value="28">Reality TV</div>
                                            <div class="item" data-value="29">Romance</div>
                                            <div class="item" data-value="30">Science Fiction</div>
                                            <div class="item" data-value="31">Soap Operas</div>
                                            <div class="item" data-value="32">Special Interests</div>
                                            <div class="item" data-value="33">Sports</div>
                                            <div class="item" data-value="34">TV Game Shows</div>
                                            <div class="item" data-value="35">TV News Programming</div>
                                            <div class="item" data-value="36">TV Talk Shows</div>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" value="Submit" class="ui black button"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="sixteen wide column">
                    <div class="ui segments">
                        <div class="ui segment">
                            <h5 class="ui header">Time cost</h5>
                        </div>
                        <div class="ui segment">
 <!--                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                            <div class="ui statistics">
                                <div class="statistic">
                                    <%if (hiveResult != null && hiveResult.containsKey("time")){%>
                                    <div class="value">
                                        <%=hiveResult.get("time")%>
                                    </div>
                                    <%}else{%>
                                    <div class="value"> </div>
                                    <%}%>
                                    <div class="label">
                                        Hive
                                    </div>
                                </div>
                                <div class="statistic">
                                    <%if (mysqlResult != null && mysqlResult.containsKey("time")){%>
                                    <div class="value">
                                        <%=mysqlResult.get("time")%>
                                    </div>
                                    <%}else{%>
                                    <div class="value"> </div>
                                    <%}%>
                                    <div class="label">
                                        MySQL
                                    </div>
                                </div>
                                <div class="statistic">
                                    <%if (neo4jResult != null && neo4jResult.containsKey("time")){%>
                                    <div class="value">
                                        <%=neo4jResult.get("time")%>
                                    </div>
                                    <%}else{%>
                                    <div class="value"> </div>
                                    <%}%>
                                    <div class="label">
                                        Neo4j
                                    </div>
                                </div>
                            </div>
<!--                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="sixteen wide column">
                    <div class="ui segments">
                        <div class="ui segment">
                            <h4 class="ui header">
                                Result
                            </h4>
                        </div>
                        <div class="ui segment">
                            <h3>Number of Films :</h3>
<!--                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                            <%if (hiveResult != null && hiveResult.containsKey("num")){%>
                            <h2>
                                <%=hiveResult.get("num")%>
                            </h2>
                            <%}%>
                            <!--                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                            <h4 class="ui horizontal header divider">
                                <i class="icon ion-ios-grid-view"></i>
                                Detail
                            </h4>
                            <table class="ui center aligned structured celled table">
                                <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>IMDB Rate</th>
<%--                                    <th>Director</th>--%>
<%--                                    <th>Actor</th>--%>
                                    <th>Time</th>
                                </tr>
                                </thead>
 <!--                                xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                                <tbody>
                                <%
                                    if (hiveResult != null && hiveResult.containsKey("movies")){
                                        List<Map> movies = (List<Map>) hiveResult.get("movies");
                                        if (movies != null){
                                            for (Map i:movies
                                            ) {%>
                                <tr>
                                    <td><%=i.get("title")%></td>
                                    <td><%=i.get("imdb")%></td>
<%--                                    <td><%=i.get("directorname")%></td>--%>
<%--                                    <td><%=i.get("actorname")%></td>--%>
                                    <td><%=i.get("time")%></td>
                                </tr>
                                <%
                                            }
                                        }
                                    }
                                %>
                                </tbody>
<!--                                xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<!--jquery-->
<script src="js/jquery-2.1.4.min.js"></script>
<!--jquery-->
<!--semantic-->
<script src="semantic/dist/semantic.min.js"></script>
<!--semantic-->
<!--counter number-->
<script src="plugins/counterup/jquery.counterup.min.js"></script>
<script src="plugins/counterup/waypoints.min.js"></script>
<!--counter number-->
<!--flot chart-->
<script src="plugins/flot/jquery.flot.js"></script>
<script src="plugins/flot/jquery.flot.resize.min.js"></script>
<script src="plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="plugins/flot/curvedLines.js"></script>
<script src="plugins/cookie/js.cookie.js"></script>
<!--chartjs chart-->

<script src="plugins/nicescrool/jquery.nicescroll.min.js"></script>

<script data-pace-options='{ "ajax": false }' src="plugins/pacejs/pace.js"></script>

<script src="js/main.js"></script>
</body>

</html>
Action & Adventure
Classics
Foreign Language & International & Foreign Films
Indian Cinema & Bollywood
Indie & Art House
Kids & Family
LGBTQ
Music Videos & Concerts
Western
Animation & Anime & Manga
Arts & Entertainment
Beauty & Fashion
Comedy
Documentary
Drama
Educational
Exercise & Fitness
Faith & Spirituality
Fantasy
Food & Drink
Gaming
Health
Home & Garden
Horror
Military & War
Musicals
Mystery & Thrillers
Performing Arts
Reality TV
Romance
Science Fiction
Soap Operas
Special Interests
Sports
TV Game Shows
TV News Programming
TV Talk Shows