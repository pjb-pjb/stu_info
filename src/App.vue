<template>
	<div id="app" style="overflow: hidden;width: 100%;">
		<div class="container" v-show="flag">
			<div style="display: flex;justify-content: space-between;height: 50px;align-items: center;font-size: 24px;background: palegreen;padding: 20px;margin-bottom: 20px;">
				<div>
					<a href="#/" class="glyphicon glyphicon-home"></a>
					<span>学生管理系统</span>
				</div>
				<div style="font-size: 18px;color: blue;">
					<span>欢迎</span>&nbsp;&nbsp;<a href="">{{uname}}</a>
					<button type="button" class="btn btn-info" @click="loginout()">退出登录</button>
				</div>
			</div>
		</div>
		<transition>
			<router-view @viewIn="change()"/>
		</transition>
	</div>
</template>
<script>
	export default {
		methods:{
			loginout(){
				sessionStorage.removeItem("login");
				sessionStorage.removeItem("name");
				sessionStorage.removeItem("id");
				this.flag=false;
				this.$router.push('/login');
			},
			change(){
				this.flag=true;
				this.uname=sessionStorage.name;
			}
		},
		data(){
			return {
				flag:false,
				uname:sessionStorage.name
			}
		},
		mounted(){
			if(sessionStorage.login=="yes"){
				this.flag=true;
			}
		}
	}
</script>

<style>
	#app {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
	}
	html,body{
		width: 100%;
	}
	.message{
		width: 100%;
		box-sizing: border-box;
		padding: 5px 70px;
		color: red;
	}
</style>