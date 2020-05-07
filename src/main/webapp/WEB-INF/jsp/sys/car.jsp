<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>
<html>
<head>
    <title>员工管理</title>
    <%@include file="/common/head.jsp"%>
</head>
<body>
<p>当前位置 : 基础管理 / 车辆管理 </p>
<div id="root">
    <Collapse value="search">
        <Panel name="search">
            条件查询
            <p slot="content">
                <i-form  inline :label-width="80">
                    <form-item label="用户代号" >
                        <i-input type="text" v-model="userVo.userCode" />
                    </form-item>
                    <form-item label="角色">
                        <i-select  v-model="userVo.userRole" style="width:200px">
                            <i-Option value=" ">【全部】</i-Option>
                            <i-Option v-for="item in roleList" :value="item.id" :key="item.id">{{ item.roleName }}</i-Option>
                        </i-select>
                    </form-item>
                    <form-item label="出生日期">
                        <row>
                            <col span="12">
                            <Date-Picker type="date" placeholder="Start date"  style="width: 180px" @on-change="userVo.startDate=$event"></Date-Picker>
                            </col>
                            <col span="12">
                            <Date-Picker type="date"  placeholder="End date"  style="width: 180px" @on-change="userVo.endDate=$event"></Date-Picker>
                            </col>
                        </row>
                    </form-item>
                    <form-item>
                        <i-button @click="searchUserList">搜索</i-button>
                    </form-item>
                </i-form>
            </p>
        </Panel>
        <card>
            <i-button type="success" >添加用户</i-button>
            <i-button type="primary" @click="toGraint">角色授权</i-button>
        </card>

    </Collapse>
    <i-table :columns="myColumns" :data="pageResult.rows" border stripe @on-selection-change="tableSelection=arguments[0]">
        <template slot-scope="{row}" slot="gender">
            {{row.gender==1?"女":"男"}}
        </template>
        <template slot-scope="{row}" slot="roleName">
            {{row.role.roleName}}
        </template>
        <template slot-scope="{row,index}" slot="action">
            <i-button type="warning" @click="toUpdate(row)" >修改</i-button>
            <i-button type="error" @click="del(row)" >刪除</i-button>
        </template>
    </i-table>
    <modal v-model="graideFlag" title="角色授权" @on-ok="graint">
        <card>
            授权对象:&nbsp;&nbsp;&nbsp;
        </card>
        <i-table :columns="myColumns2" :data="roleList" border stripe @on-selection-change="tableSelection2=arguments[0]">

        </i-table>

    </modal>
    <page :total="pageResult.tatal" <%--总页数--%>
          :current.sync="pageNo"  <%--当前页--%>
          :page-size="pageSize"     <%--每页条数--%>
          @on-change="searchUserList"   <%-- 页码改变的回调，返回改变后的页码 --%>
          show-sizer        <%-- 显示分页，用来改变page-size --%>
          :page-size-opts="[5,10,15]" <%--每页条数切换的配置 --%>
          @on-page-size-change="changePageSize(arguments[0])" <%-- 切换每页条数时的回调，返回切换后的每页条数 --%>
    />
</div>
<script >
    new Vue({
        el:"#root",
        data:{
            myColumns:[
                {type: 'selection',width: 60,align: 'center'},
                {key:"carNumber",title:"车牌号"},
                {key:"carType",title:"车型"},
                {slot:"carColor",title:"颜色"},
                {key:"carPrice",title:"价格"},
                {key:"rentprice",title:"租赁价格"},
                {key:"carDemp",title:"介绍"},
                {key:"deposit",title:"押金"},
                {key:"carImg",title:"图片"},
                {slot:"action",title:"操作",width:200}
            ],
            pageResult:{
                rows:[],
                tatal:0
            },
            userVo:{},
            roleList:[],
            pageNo:1,
            pageSize:5,
            graideFlag:false,
            tableSelection:[],
            tableSelection2:[],
            graintId:0,
            graintRoleId:0,

        },
        mounted(){
            this.searchUserList();
            this.searchRoleList();
        },
        methods:{
        }
    });
</script>
</body>
</html>
