<template>
	<div class="box">
		<h3 style="text-align: center;margin-bottom: 20px;">注册页面</h3>
		<div class="message">{{message}}</div>
		<form class="form-horizontal" action="javascript:">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">User</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3" placeholder="账号" v-model="uname" @keyup="up">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword3" placeholder="密码" v-model="upass">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" @click="check">注册</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已注册？请<a href="#/">登录</a>
				</div>
			</div>
		</form>
	</div>
</template>

<script>
	export default{
		data(){
			return {
				uname:"",
				upass:"",
				message:""
			}
		},
		methods:{
			up(){
				if(!this.uname){
					this.message="用户名不能为空";
					return;
				}
				fetch("/api/checkUser?uname="+this.uname).then(function(e){
					return e.text();
				}).then(function(e){
					if(e=="err"){
						this.message="用户名已存在";
						return;
					}
					this.message="";
				}.bind(this));
			},
			check(){
				if(!this.uname){
					this.message="用户名不能为空";
					return;
				}
				if(!this.upass){
					this.message="密码不能为空";
					return;
				}
				if(this.message=="用户名已存在"){
					return;
				}
				fetch("/api/checkReg?uname="+this.uname+"&upass="+this.upass).then(function(e){
					return e.json();
				}).then(function(e){
					console.log(e);
					if(e.message=="err"){
						this.message="注册失败";
					}else{
						this.message="注册成功";
					this.$router.push('/login');
					}
					this.uname="";
					this.upass="";
				}.bind(this));
				
			}
		}
	}
</script>

<style>
	.box {
		position: absolute;
		width: 400px;
		height: 300px;
		left: 0;
		right: 0;
		bottom: 0;
		top: 0;
		margin: auto;
		border: 1px s #ccc;
	}
</style>