// 数据
var _menus = {
    "menus": [{
        "menuid": "1",
        "menuname": "用户管理",
        "menus": [{
            "menuid": "11",
            "menuname": "学生管理",
            "url": "admin_studentManager.action"
            },
            {
                "menuid": "12",
                "menuname": "教师管理",
                "url": "admin_teacherManager.action"
            },
            {
                "menuid": "13",
                "menuname": "注册管理",
                "url": "admin_registerManager.action"
            }
        ]
    }, {
        "menuid": "2",
        "menuname": "资源管理",
        "menus": [{
            "menuid": "21",
            "menuname": "资源管理",
            "url": "admin_resourceManager.action"
            },
            {
                "menuid": "22",
                "menuname": "类别管理",
                "url": "admin_categoryManager.action"
            }
        ]
    }, {
        "menuid": "3",
        "menuname": "论坛管理",
        "menus": [{
            "menuid": "31",
            "menuname": "帖子管理",
            "url": "admin_postManager.action"
            },
            {
                "menuid": "32",
                "menuname": "评论管理",
                "url": "admin_commentManager.action"
            }
        ]
    }
    ]
};
$(function () {
    InitLeftMenu();
})

//初始化左侧
function InitLeftMenu() {
    $("#nav").accordion({animate: true, selected: 999});
    $.each(_menus.menus, function (i, n) {
        var menulist = '';
        menulist += '<ul>';
        $.each(n.menus, function (j, o) {
            menulist += '<li><div><a ref="' + o.menuid + '" href="#" rel="' + o.url + '" ><span class="nav">' + o.menuname + '</span></a></div></li> ';
        })
        menulist += '</ul>';
        $('#nav').accordion('add', {
            title: n.menuname,
            content: menulist,
            selected: false
        });

    });

    $('.easyui-accordion li a').click(function () {
        var tabTitle = $(this).children('.nav').text();
        var url = $(this).attr("rel");
        var menuid = $(this).attr("ref");
        addTab(tabTitle, url);
        $('.easyui-accordion li div').removeClass("selected");
        $(this).parent().addClass("selected");
    }).hover(function () {
        $(this).parent().addClass("hover");
    }, function () {
        $(this).parent().removeClass("hover");
    });

    // //选中第一个
    // var panels = $('#nav').accordion('panels');
    // var t = panels[0].panel('options').title;
    // $('#nav').accordion('select',t);
}

function addTab(subtitle, url) {
    if (!$('#tabs').tabs('exists', subtitle)) {
        $('#tabs').tabs('add', {
            title: subtitle,
            content: createFrame(url),
            closable: true,
        });
    } else {
        $('#tabs').tabs('select', subtitle);
        $('#mm-tabupdate').click();
    }
}

function createFrame(url) {
    var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}

//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
}
