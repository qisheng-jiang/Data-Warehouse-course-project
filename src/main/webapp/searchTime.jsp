<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Search According to Time</title>
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
                <a class="item" href="searchTitle.html">
                    Title
                </a>
                <a class="item" href="searchDirector.html">
                    Director
                </a>
                <a class="item" href="searchActor.html">
                    Actor
                </a>
                <a class="item" href="searchGenre.html">
                    Genres
                </a>
                <a class="item" href="searchPartnership.html">
                    Partnership
                </a>
                <a class="item" href="searchCooperationMovie.html">
                    Cooperation Movie
                </a>
                <a class="item" href="searchAudience.html">
                    Audience
                </a>
                <a class="item" href="integratedSearch.html">
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
            <h3 class="ui header">Time Search</h3>
            <div class="row">
                <div class="sixteen wide column">
                    <div class="ui segments">
                        <div class="ui segment">
                            <form class="ui form" method="post" action="timeSearch">
                                <h4 class="ui dividing header">Setting time</h4>
                                <div class="four fields">
                                    <div class="field">
                                        <label>Year</label>
                                        <input type="text" name="year" placeholder="Year">
                                    </div>
                                    <div class="field">
                                        <label>Month</label>
                                        <div class="ui selection dropdown">
                                            <input type="hidden" name="month">
                                            <div class="default text">Month</div>
                                            <i class="dropdown icon"></i>
                                            <div class="menu">
                                                <div class="item" data-value="0">Any</div>
                                                <div class="item" data-value="1">1</div>
                                                <div class="item" data-value="2">2</div>
                                                <div class="item" data-value="3">3</div>
                                                <div class="item" data-value="4">4</div>
                                                <div class="item" data-value="5">5</div>
                                                <div class="item" data-value="6">6</div>
                                                <div class="item" data-value="7">7</div>
                                                <div class="item" data-value="8">8</div>
                                                <div class="item" data-value="9">9</div>
                                                <div class="item" data-value="10">10</div>
                                                <div class="item" data-value="11">11</div>
                                                <div class="item" data-value="12">12</div>
                                                <div class="item" data-value="13">The 1 Quarter</div>
                                                <div class="item" data-value="14">The 2 Quarter</div>
                                                <div class="item" data-value="15">The 3 Quarter</div>
                                                <div class="item" data-value="16">The 4 Quarter</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label>Day</label>
                                        <input type="text" name="day" placeholder="Day">
                                    </div>
                                    <div class="field">
                                        <label>Weekday</label>
                                        <div class="ui selection dropdown">
                                            <input type="hidden" name="weekday">
                                            <div class="default text">Weekday</div>
                                            <i class="dropdown icon"></i>
                                            <div class="menu">
                                                <div class="item" data-value="7">Sunday</div>
                                                <div class="item" data-value="1">Monday</div>
                                                <div class="item" data-value="2">Tuesday</div>
                                                <div class="item" data-value="3">Wednesday</div>
                                                <div class="item" data-value="4">Thursday</div>
                                                <div class="item" data-value="5">Friday</div>
                                                <div class="item" data-value="6">Saturday</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ui black submit button">Search</div>
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
                                    <div class="value">
                                        22
                                    </div>
                                    <div class="label">
                                        Hive
                                    </div>
                                </div>
                                <div class="statistic">
                                    <div class="value">
                                        31
                                    </div>
                                    <div class="label">
                                        MySQL
                                    </div>
                                </div>
                                <div class="statistic">
                                    <div class="value">
                                        22
                                    </div>
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
                            <h2>233</h2>
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
                                </tr>
                                </thead>
<!--                                xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx改-->
                                <tbody>
                                <tr>
                                    <td>2002-10</td>
                                    <td>579</td>
                                </tr>
                                <tr>
                                    <td>2002-11</td>
                                    <td>555</td>
                                </tr>
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
