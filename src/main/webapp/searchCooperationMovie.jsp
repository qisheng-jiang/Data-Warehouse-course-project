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
    <title>Search Cooperation Movie</title>
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

            <a class="title item" href="home.html">
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
            <h3 class="ui header">Cooperation Movie Search</h3>
            <div class="row">
                <div class="sixteen wide column">
                    <div class="ui segments">
                        <div class="ui segment">
                            <form class="ui form" method="post" action="cooperationSearch">
                                <h4 class="ui dividing header">The two</h4>
                                <div class="two fields">
                                    <div class="field">
                                        <label>Actor</label>
                                        <input type="text" name="actorName" placeholder="Full Name">
                                    </div>
                                </div>
                                <div class="two fields">
                                    <div class="field">
                                        <label>Cooperator</label>
                                        <input type="text" name="cooperationName" placeholder="Full Name">
                                    </div>
                                    <div class="field">
                                        <label>Role</label>
                                        <div class="ui selection dropdown">
                                            <input type="hidden" name="role">
                                            <div class="default text">Role</div>
                                            <i class="dropdown icon"></i>
                                            <div class="menu">
                                                <div class="item" data-value="0">Actor</div>
                                                <div class="item" data-value="1">Director</div>
                                            </div>
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
                            <h3>Times of cooperation:</h3>
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
                                    <th>Director</th>
                                    <th>Actor</th>
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
                                    <td><%=i.get("directorname")%></td>
                                    <td><%=i.get("actorname")%></td>
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
