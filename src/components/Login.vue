<template>
	<div class="box">
		<h3 style="text-align: center;margin-bottom: 20px;">登录页面</h3>
		<div class="message">
			{{message}}
		</div>
		<form class="form-horizontal" action="javascript:">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">User</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3" placeholder="账号" v-model="uname">
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
					<button type="submit" class="btn btn-default" @click="login">登录</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;没有账号？请<router-link to="/reg">注册</router-link>
				</div>
			</div>
		</form>
	</div>
</template>

<script>
	export default{
		methods:{
			login(){
				if(!this.uname){
					this.message="用户名不能为空";
					return;
				}
				if(!this.upass){
					this.message="密码不能为空";
					return;
				}
				fetch("/api/login/"+this.uname+"/"+this.upass).then(function(e){
					return e.json();
				}).then(function(e){
					
					if(e.message=="err"){
						this.message="用户名或密码错误";
					}else{
						console.log(e);
						sessionStorage.login="yes";						
						sessionStorage.name=e.uname;						
						sessionStorage.id=e.id;						
						this.$emit('viewIn');
						this.$router.push("/");
					}
				}.bind(this))
			}
		},
		data(){
			return {
				uname:"",
				upass:"",
				message:""
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