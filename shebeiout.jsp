<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="height=device-height, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.easyui.min.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/vue-resouce.js"></script>
</head>
<body>
 <div id="app2">
 <div id="dd" v-show="show">
        <table class="table table-bordered table-hover table-striped">
            <thead>
               <tr>
                    <th>扫码号</th><th>名字</th><th>sn</th><th>状态</th><th>操作</th>
                </tr>
            </thead>    
    <tbody>
                
                <tr v-for="item in list">
                     <td><input type="text" class="form-control" v-model="id_2">原数据：{{item.id_2}}</td>
                    <td><input type="text" class="form-control" v-model="name">原数据：{{item.name}}</td>
                    <td><input type="text" class="form-control" v-model="sn">原数据：{{item.sn}}</td>
                    <td><input type="text" class="form-control" v-model="beizhu">原数据：{{item.beizhu}}</td>
                    <td><a href="" @click.prevent="mod2(item.id)">确定</a>
                    </td>
                </tr>
            </tbody>
        </table>
</div>
<div v-show="show2">
        <div class="panel panel-primary">
            
                <div class="panel-heading">
             <h3 class="panel-title">搜索栏</h3>
            </div>
            <div class="panel-body form-inline">
                <label>
                    按状态搜索:<select class="form-control" v-model="keywords">
                        <option>仓库内</option>
                        <option>借出</option>
                        <option>维修</option>
                        <option value=''>全部</option>
                    </select>
                </label>     
            </div>
        </div>
    	<table class="table table-bordered table-hover table-striped">
            <thead>
               <tr>
                    <th>扫码号</th><th>名字</th><th>sn</th><th>状态</th><th>操作</th>
                </tr>
            </thead>
            <tbody>
                
                <tr v-for="item in search(keywords)">
                     <td>{{item.id_2}}</td>
                    <td>{{item.name}}</td>
                    <td>{{item.sn}}</td>
                    <td>{{item.beizhu}}</td>
                    <td><a href="" @click.prevent="del(item.id)">删除</a>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
            
        <a href="" @click.prevent="back()">返回</a>
    </div>

     <script type="text/javascript">
    	var vm2=new Vue({
    		el:'#app2',
    		data:{
    			id:0,
                id_2:'',
                name:'',
                sn:'',
                beizhu:'',
                keywords:'',
                keywords2:'',
    			list:[{}],
    			show:false,
    			show2:true
    		},
            created(){
                this.getlist()
            },
    		methods:{
    			add(){
    				this.$http.post('add.jsp',{id_2:this.id_2,name:this.name,sn:this.sn,beizhu:this.beizhu},{emulateJSON:true}).then(result=> {this.getlist()})
                    },
                del(id){
                    this.$http.post('del.jsp',{id:id},{emulateJSON:true}).then(result=> { this.getlist()})
                },
                mod(id){
                    this.$http.post('mod2.jsp',{id:id},{emulateJSON:true}).then(result=> {
                    this.list=result.body;this.show=true;this.show2=false;

                    })
                    //console.log(list);
                },
                mod2(id){
                	this.$http.post('mod.jsp',{id_2:this.id_2,name:this.name,sn:this.sn,beizhu:this.beizhu,id:id},{emulateJSON:true}).then(result=> {this.getlist()})
                	console.log(id);this.show=false;this.show2=true;
                },
                search(keywords){
                // var newlist=[]
                // this.list.forEach(item=>
                // {
                //     if(item.name.indexOf(keywords)!=-1){
                //         newlist.push(item)
                //     }
                // })
                // return newlist;
                return this.list.filter(item=>{
                   // if(item.name.indexOf(keywords)!=-1)
                   if(item.beizhu.includes(keywords)){
                    return item
                   }
                })
               // return newlist
            },
            getlist(){
            	$("td,th").addClass("text-center");
                this.$http.get('shebeiout3.jsp').then(result=> {
                       // var result=result.body
                       this.list=result.body;
                       //console.log(result.body);
                       // for(var i=0;i<10;i++){
                       //  this.list.push(result.body[i])
                       // }
                       console.log(this.list)
                    })
            },
            back(){
            	this.getlist();this.keywords='';
            }
            
    	}
    	});

        
    </script>
</body>
</html>