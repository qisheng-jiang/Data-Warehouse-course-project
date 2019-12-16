<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>功能点2</title>
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
        <!--sidebar-->
        <div class="ui sidebar vertical left menu overlay  borderless visible sidemenu inverted  grey" style="-webkit-transition-duration: 0.1s; transition-duration: 0.1s;" data-color="grey">
<%--            <a class="item logo" href="index.html">--%>
<%--                <img src="img/logo.png" alt="stagblogo" /><img src="img/thumblogo.png" alt="stagblogo" class="displaynone" />--%>
<%--            </a>a--%>
            <div class="ui accordion inverted">

                <a class="title item">
                    <i class="ion-podium titleIcon icon"></i> Dashboard <i class="dropdown icon"></i>
                </a>
                <div class="content">
                    <a class="item" href="">
                        Dashboard
                    </a>
                </div>

                <a class="title item">
                    <i class="ion-ios-pie titleIcon icon"></i>

                    <i class="dropdown icon"></i> 单表查询
                </a>
                <div class="content">
                    <a class="item" href="func_1.html">
                        时间查询
                    </a>
                    <a class="item" href="func_2.jsp">
                        电影名称查询
                    </a>
                    <a class="item" href="func_3.html">
                        导演查询
                    </a>
                    <a class="item" href="func_4.html">
                        演员查询
                    </a>
                    <a class="item" href="func_5.html">
                        类别查询
                    </a>
                    <a class="item" href="func_6.html">
                        合作关系查询
                    </a>
                    <a class="item" href="func_7.html">
                        黄金上映期查询
                    </a>

                </div>
                <a class="title item">
                    <i class="ion-ios-settings titleIcon  icon"></i>

                    <i class="dropdown icon"></i> 分析
                </a>
                <div class="content">
                    <a class="item" href="analysis_1.html">
                        执行时间分析
                    </a>
                </div>
            </div>

            <div class="ui divider"></div>
        </div>
        <div class="ui tab" data-tab="fourth">
            <div class="ui divider"></div>
        </div>
    </div>
    <div class="pusher">
        <!--navbar-->
        <!--maincontent-->
        <div class="mainWrap navslide">
            <div class="ui equal width left aligned padded grid stackable">
                <div class="divider"></div>
                <h3 class="ui header">电影名称查询</h3>
                <div class="row">
                    <div class="sixteen wide column">
                        <div class="ui segments">
                            <div class="ui segment">
                                <h5 class="ui header">查询分析</h5>
                            </div>
                            <div class="ui segment">
                                <div class="ui labeled button" tabindex="0">
                                    <div class="ui basic blue button">
                                        <i class="line chart icon"></i> 数据总量
                                    </div>
                                    <a class="ui basic left pointing blue label">
                                        84551
                                    </a>
                                </div>
                                <div class="ui labeled button" tabindex="0">
                                    <div class="ui basic blue button">
                                        <i class="line chart icon"></i> 查询方式
                                    </div>
                                    <a class="ui basic left pointing blue label">
                                        电影名称模糊查询
                                    </a>
                                </div>
                                <div class="ui labeled button" tabindex="0">
                                </div>

                                <form action="QueryExample" method="POST">
                                    电影名:<input type="text" name="movieName" id="movieName">
                                    <button type="submit">提交</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sixteen wide column">
                        <div class="ui segments">
                            <div class="ui segment">
                                <h5 class="ui header">时间对比</h5>
                            </div>
                            <div class="ui segment">
                                <div class="ui left labeled button" tabindex="0">
                                    <a class="ui basic right pointing label">
                                        21ms
                                    </a>
                                    <div class="ui button blue">
                                        <i class="star icon"></i> MySQL
                                    </div>
                                </div>
                                <div class="ui left labeled button" tabindex="0">
                                    <a class="ui basic right pointing label">
                                        11103ms
                                    </a>
                                    <div class="ui button blue">
                                        <i class="star icon"></i> Hive
                                    </div>
                                </div>
                                <div class="ui left labeled button" tabindex="0">
                                    <a class="ui basic right pointing label">
                                        167ms
                                    </a>
                                    <div class="ui button blue">
                                        <i class="star icon"></i> Neo4j
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sixteen wide column">
                        <div class="ui segments">
                            <div class="ui segment">
                                <h5 class="ui header">
                                    结果展示
                                </h5>
                            </div>
                            <div class="ui segment">
                                <table class="ui center aligned structured celled table">
                                    <thead>
                                        <tr>
                                            <th>电影名称</th>
                                            <th>版本数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        List<String> names = (List<String>) request.getAttribute("names");
                                        List<Integer> nums = (List<Integer>) request.getAttribute("nums");
                                        if (names != null){
                                        for (int i = 0; i < names.size(); i++) {%>
                                    <tr>
                                        <td><%=names.get(i)%></td>
                                        <td><%=nums.get(i)%></td>
                                    </tr>

                                    <%}}%>
                                    </tbody>
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
    <!--flot chart-->
    <!--chartjs chart-->
    <script src="plugins/chartjs/chart.min.js"></script>
    <script src="plugins/echarts/echarts.min.js"></script>
    <script src="js/echarts-wordcloud.min.js"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('main1'));
        var myChart2 = echarts.init(document.getElementById('main2'));
        var myChart3 = echarts.init(document.getElementById('main3'));
        var myChart4 = echarts.init(document.getElementById('main4'));

        option1 = {
            title: {
                text: '每年四个季度电影上映数量\n',
                subtext: ''
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['第一季度', '第二季度', '第三季度', '第四季度'],
                left: 'right'
            },
            toolbox: {
                show: false,
                feature: {
                    dataView: {
                        show: true,
                        readOnly: false
                    },
                    magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },
                    restore: {
                        show: true
                    },
                    saveAsImage: {
                        show: true
                    }
                }
            },
            calculable: true,
            xAxis: [{
                type: 'category',
                data: ['2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012']
            }],
            yAxis: [{
                type: 'value'
            }],
            series: [{
                name: '第一季度',
                type: 'bar',
                data: [1658, 1514, 1775, 1538, 1775, 1623, 1521, 1557, 1572, 1732],
                markPoint: {
                    data: [{
                            type: 'max',
                            name: '最大值'
                        },
                        {
                            type: 'min',
                            name: '最小值'
                        }
                    ]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '平均值'
                    }]
                }
            }, {
                name: '第二季度',
                type: 'bar',
                data: [1392, 1367, 1508, 1550, 1429, 1542, 1431, 1357, 1651, 1770],
                markPoint: {
                    data: [{
                            type: 'max',
                            name: '最大值'
                        },
                        {
                            type: 'min',
                            name: '最小值'
                        }
                    ]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '平均值'
                    }]
                }
            }, {
                name: '第三季度',
                type: 'bar',
                data: [1488, 1622, 1788, 1391, 1617, 1514, 1470, 1448, 1578, 1990],
                markPoint: {
                    data: [{
                            type: 'max',
                            name: '最大值'
                        },
                        {
                            type: 'min',
                            name: '最小值'
                        }
                    ]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '平均值'
                    }]
                }
            }, {
                name: '第四季度',
                type: 'bar',
                data: [1456, 1596, 1584, 1350, 1548, 1411, 1532, 1405, 1681, 1556],
                markPoint: {
                    data: [{
                            type: 'max',
                            name: '最大值'
                        },
                        {
                            type: 'min',
                            name: '最小值'
                        }
                    ]
                },
                markLine: {
                    data: [{
                        type: 'average',
                        name: '平均值'
                    }]
                }
            }]
        };

        option2 = {
            title: {
                text: '各类电观影数量趋势'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['Action', 'Horror', 'Kids'],
                left: 'right'
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                    name: 'Action',
                    type: 'line',
                    stack: '总量',
                    data: [16062, 6009, 3711, 2880, 2601, 4428, 4203, 1886, 4385, 3504]
                },
                {
                    name: 'Horror',
                    type: 'line',
                    stack: '总量',
                    data: [10749, 4265, 1620, 1380, 959, 2273, 3786, 1688, 2657, 1420]
                },
                {
                    name: 'Kids',
                    type: 'line',
                    stack: '总量',
                    data: [8654, 3236, 1766, 2251, 770, 2238, 1110, 1985, 1208, 2559]
                }
            ]
        };


        option3 = {
            title: {
                text: '各类语言电影占比',
                subtext: '',
                x: 'left'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'right',
                data: ['English', 'Spanish', 'Chinese', 'Arabic', 'Portuguese', 'Japanese', 'Russian', 'German', 'Italian', 'French']
            },
            series: [{
                name: '电影数量',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: [{
                        value: 59889,
                        name: 'English'
                    },
                    {
                        value: 6168,
                        name: 'Spanish'
                    },
                    {
                        value: 263,
                        name: 'Chinese'
                    },
                    {
                        value: 198,
                        name: 'Arabic'
                    },
                    {
                        value: 471,
                        name: 'Portuguese'
                    },
                    {
                        value: 3566,
                        name: 'Japanese'
                    },
                    {
                        value: 467,
                        name: 'Russian'
                    },
                    {
                        value: 3792,
                        name: 'German'
                    },
                    {
                        value: 2212,
                        name: 'Italian'
                    },
                    {
                        value: 7401,
                        name: 'French'
                    }
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }]
        };

        function createRandomItemStyle() {
            return {
                normal: {
                    color: 'rgb(' + [
                        Math.round(Math.random() * 160),
                        Math.round(Math.random() * 160),
                        Math.round(Math.random() * 160)
                    ].join(',') + ')'
                }
            };
        }

        option4 = {
            title: {
                text: '导演执导电影数量对比'
            },
            tooltip: {
                show: true
            },
            series: [{
                name: '执导电影数量',
                type: 'wordCloud',
                size: ['80%', '80%'],
                textRotation: [0, 45, 90, -45],
                textPadding: 0,
                autoSize: {
                    enable: true,
                    minSize: 50
                },
                data: [{
                        name: "Robert N. Bradbury",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Terence Young",
                        value: 9,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Farrow",
                        value: 9,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Tom Trbovich",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jean-Jacques Beineix",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Kevin Dunn",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Michael Winner",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Chemical Burn Entertainment",
                        value: 14,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Landis",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "GÃ¶tz Friedrich",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Brian Large",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Diego Arsuaga",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Dave Palmer (III)",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mike Shiell",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Robert Scull",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Donald Kim",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Bill Giggie",
                        value: 22,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David L. Corley",
                        value: 6,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Henry Levin",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Arthur Dong",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Gela Babluani",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Sakabe Koji",
                        value: 8,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Fernando Trueba",
                        value: 30,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mike Figgis",
                        value: 32,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Georg Tressler",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "James Bridges",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Alf Kjellin",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Saket Chaudhary",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Arthur Allan Seidelman",
                        value: 19,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ron Mann",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mario Azzopardi",

                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Holly Dale",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Peter Deluise",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "James Head",
                        value: 13,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Andy Mikita",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David Warry-Smith",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Brad Turner",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David Winning",
                        value: 32,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Martin Wood",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jake Scott",
                        value: 8,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jon Brewer",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Lucky",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Piers Wenger",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Lavin",
                        value: 32,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Emilio Estevez",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Eikichi Kojika",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Osamu Sekita",
                        value: 23,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "RyÃ ́ji Fujiwara",
                        value: 6,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Shin'ya Sadamitsu",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Susumu GyÃ ́da",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Takuya SatÃ ́",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Tomokazu Tokoro",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Takeshi Mori",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Tomomichi Mochizuki",
                        value: 25,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Kazuhiro Furuhashi",
                        value: 23,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Tsutomu Shibayama",
                        value: 61,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Shigeyasu Yamauchi",
                        value: 26,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "James Foley",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Nicolas Roeg",
                        value: 9,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Robert Altman",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Scott Reynolds",
                        value: 22,

                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Gabriel Sabloff",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ron Howard",
                        value: 108,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "James Glickenhaus",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Patrick Shanley",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mark Dindal",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Kevin Lima",
                        value: 51,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Dominic Anciano",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ray Burdis",
                        value: 45,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ben Sharpsteen",
                        value: 48,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Bill Roberts",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jack Kinney",
                        value: 90,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Elliotte",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Norman Ferguson",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "George Scribner",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Wolfgang Reitherman",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David Schmoeller",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "McG",
                        value: 38,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Neal Sundstrom",
                        value: 34,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Rich Wilkes",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Josef von Sternberg",
                        value: 14,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Aria Entertainment",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Ford",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Daniel Zirilli",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Glen",
                        value: 5,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jonathan Stokes",
                        value: 27,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Grant MacDonald",
                        value: 13,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Dario Argento",
                        value: 5,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Arthur Marks",
                        value: 25,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Suzanne Deason",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ted Landon",
                        value: 30,
                        itemStyle: createRandomItemStyle()
                    },

                    {
                        name: "Michael Curtiz",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mike Leigh",
                        value: 31,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Kenny Ortega",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Miles Hanon",
                        value: 23,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Henry Hathaway",
                        value: 22,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Greg Carter",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Sean S. Cunningham",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Alfonso CuarÃ3n",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Scholastic",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Billy Wilder",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "WILLIAM NIGH",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ken Klein",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Wonsuk Chin",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "MVD",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Bruce Seth Green",
                        value: 14,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ivan Reitman",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Vic Armstrong",
                        value: 5,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jay Kanzler",
                        value: 5,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Norman Foster",
                        value: 17,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Roy Huggins",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Audu Paden",
                        value: 21,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Edoardo Margheriti",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Micky Dolenz",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Peter Tork",
                        value: 8,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jon C. Andersen",
                        value: 8,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mike Elliot (III)",
                        value: 38,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "James Frawley",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Bryan Singer",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Orson Welles",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David Hugh Jones",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Fred Gerber",

                        value: 21,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Robert Benton",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Barry Levinson",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Steven Spielberg",
                        value: 83,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Albert Hughes",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Allen Hughes",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John McTiernan",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "mgm",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mark Steven Johnson",
                        value: 11,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Adam Dubin",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "CreateSpace",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Peter Maris",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Victor Fleming",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Cassandra Peterson",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Eric Gardner",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Richard Linklater",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Andrew Bergman",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ben Edwards",
                        value: 23,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Nick Thompson",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Juris Podnieks",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Dylan Kidd",
                        value: 5,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jason Connery",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Brian Grant",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David Rubin",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Brad Rader",
                        value: 11,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Chuck Patton",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Eric Radomski",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Frank Paur",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jennifer Yuh Nelson",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Sam Weisman",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Richard J. Baskin",
                        value: 17,

                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Don Dohler",
                        value: 13,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Martin Rosen",
                        value: 6,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Korty",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Oliver Hirschbiegel",
                        value: 6,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Amir Bar-Lev",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Nick Quested",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Harold Ramis",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Tim Blake Nelson",
                        value: 8,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Unavailable",
                        value: 17,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Marty Callner",
                        value: 20,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "LucÃa Puenzo",
                        value: 19,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Martin Spottl",
                        value: 21,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jessy Terrero",
                        value: 17,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Clint Eastwood",
                        value: 11,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Guy Maddin",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Ron Ford",
                        value: 28,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Michael Haigney",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Kunihiko Yuyama",
                        value: 38,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mel Stuart",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Scott Perry",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "William Lustig",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Timothy Hill",
                        value: 17,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "David Lowell Rich",
                        value: 86,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "MJM Productions",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Willard Huyck",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Matthew O'Callaghan",
                        value: 31,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Bob Rafelson",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Robert C. Cooper",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "John Elias Michalakis",
                        value: 7,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jean Rollin",
                        value: 12,
                        itemStyle: createRandomItemStyle()
                    },

                    {
                        name: "Michael Heumann",
                        value: 4,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "FrÃ©dÃ©ric Fonteyne",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Patrick Lussier",
                        value: 10,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Joel Hodgson",
                        value: 13,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Arch Hall Sr.",
                        value: 16,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Nigel Cole",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Lars von Trier",
                        value: 8,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "James Moll",
                        value: 20,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Josef Rusnak",
                        value: 9,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Lee Jeong-beom",
                        value: 3,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Allan Dwan",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Jason Priestly",
                        value: 22,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Mixtape",
                        value: 1,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Patrick Coyle",
                        value: 56,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Yossi Wein",
                        value: 9,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Don Taylor",
                        value: 18,
                        itemStyle: createRandomItemStyle()
                    }, {
                        name: "Nicholas Hynter",
                        value: 2,
                        itemStyle: createRandomItemStyle()
                    }
                ]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        myChart2.setOption(option2);
        myChart3.setOption(option3);
        myChart4.setOption(option4);
    </script>
    <!--chartjs chart-->

    <script src="plugins/nicescrool/jquery.nicescroll.min.js"></script>

    <script data-pace-options='{ "ajax": false }' src="plugins/pacejs/pace.js"></script>

    <script src="plugins/chartist/chartist.min.js"></script>

    <script src="js/dashboard2.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            var show = document.getElementById("show");
            setInterval(function() {
                var time = new Date();
                // 程序计时的月从0开始取值后+1
                var m = time.getMonth() + 1;
                var t = "时间：" + time.getFullYear() + "年" + m + "月" +
                    time.getDate() + "日 " + time.getHours() + ":" +
                    time.getMinutes() + ":" + time.getSeconds();
                show.innerHTML = t;
            }, 1000);
        };
    </script>
</body>

</html>